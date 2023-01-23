import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/error/exceptions.dart';
import '../../domain/entities/user/user_entity.dart';
import '../models/auth/authentication_model.dart';

abstract class AuthenticationService {
  AuthenticationModel getCurrentUser();
  Future<bool> updateUser(UserEntity user);

  Future<AuthenticationModel> signUp(String email, password);

  Future<AuthenticationModel> signIn(String email, password);

  Future<bool> signOut();
  Future<UserCredential> signInWithFacebook();
  Future<UserCredential> signInWithGoogle();
}

class AuthenticationServiceImpl extends AuthenticationService {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  AuthenticationServiceImpl(
      {required this.firebaseAuth, required this.firebaseFirestore});

  @override
  AuthenticationModel getCurrentUser() {
    return _getCurrentUser();
  }

  @override
  Future<AuthenticationModel> signUp(String email, password) {
    return _signUp(email, password);
  }

  @override
  Future<UserCredential> signInWithFacebook() {
    return _signInWithFacebook();
  }

  @override
  Future<UserCredential> signInWithGoogle() {
    return _signInWithGoogle();
  }

  @override
  Future<AuthenticationModel> signIn(String email, password) {
    return _signIn(email, password);
  }

  @override
  Future<bool> signOut() {
    return _signOut();
  }

  @override
  Future<bool> updateUser(UserEntity user) {
    return _updateUser(user);
  }

  AuthenticationModel _getCurrentUser() {
    User? user = firebaseAuth.currentUser;
    if (user != null) {
      return AuthenticationModel.fromFirebaseUser(user);
    } else {
      throw AuthenticationException();
    }
  }

  Future<AuthenticationModel> _signUp(String email, password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        firebaseFirestore.collection("Users").doc(userCredential.user!.uid).set(
            {'email': email, 'password': password, 'name': "", "username": ""});
        return AuthenticationModel.fromFirebaseUser(userCredential.user!);
      } else {
        throw AuthenticationException();
      }
    } catch (e) {
      throw AuthenticationException();
    }
  }

  Future<AuthenticationModel> _signIn(String email, password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        return AuthenticationModel.fromFirebaseUser(userCredential.user!);
      } else {
        throw AuthenticationException();
      }
    } catch (e) {
      throw AuthenticationException();
    }
  }

  Future<bool> _signOut() async {
    try {
      await firebaseAuth.signOut();
      return true;
    } catch (e) {
      throw AuthenticationException();
    }
  }

  Future<UserCredential> _signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      if (userCredential.user != null) {
        firebaseFirestore
            .collection("Users")
            .doc(userCredential.user!.uid)
            .set({'email': userCredential.user!.email});
        return userCredential;
      } else {
        throw AuthenticationException();
      }
    } catch (e) {
      throw AuthenticationException();
    }
  }

  Future<UserCredential> _signInWithGoogle() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await auth.signInWithCredential(authCredential);

      if (userCredential.user != null) {
        firebaseFirestore
            .collection("Users")
            .doc(userCredential.user!.uid)
            .set({'email': userCredential.user!.email});
        return userCredential;
      }
    } catch (e) {
      print(e.toString());
      throw AuthenticationException();
    }

    throw AuthenticationException();
  }

  Future<bool> _updateUser(UserEntity user) async {
    final uid = user.uid;
    final userCollection = firebaseFirestore.collection("Users").doc(uid);

    Map<String, dynamic> userInformation = {};

    if (user.username != "" && user.username != null) {
      userInformation['username'] = user.username;
    }

    if (user.name != "" && user.name != null) {
      userInformation['name'] = user.name;
    }

    userCollection.update(userInformation);
    return true;
  }
}
