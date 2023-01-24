// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pomodofocus/features/domain/entities/user/user_entity.dart';

import '../../../../core/error/failures.dart';
import '../../../domain/entities/auth/authentication_entity.dart';
import '../../../domain/repository/auth/authentication_repository.dart';
import '../../datasources/auth/authentication_service.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationService authenticationService;
  AuthenticationRepositoryImpl({
    required this.authenticationService,
  });

  @override
  Future<Either<Failure, AuthenticationEntity>> getCurrentUser() {
    return _getCurrentUser();
  }

  @override
  Future<bool> signOut() {
    return _signOut();
  }

  @override
  Future<Either<Failure, bool>> updateUser(String fullname, nickname, userId) {
    return _updateUser(fullname, nickname, userId);
  }

  @override
  Future<Either<Failure, AuthenticationEntity>> signIn(String email, password) {
    return _signIn(email, password);
  }

  @override
  Future<Either<Failure, UserCredential>> signInWithFacebook() {
    return _signInWithFacebook();
  }

  @override
  Future<Either<Failure, UserCredential>> signInWithGoogle() {
    return _signInWithGoogle();
  }

  @override
  Future<Either<Failure, AuthenticationEntity>> signUp(String email, password) {
    return _signUp(email, password);
  }

  Future<Either<Failure, AuthenticationEntity>> _getCurrentUser() async {
    try {
      AuthenticationEntity authenticationEntity =
          authenticationService.getCurrentUser();
      return Right(authenticationEntity);
    } catch (e) {
      return Left(AuthenticationFailure());
    }
  }

  Future<bool> _signOut() async {
    bool logOutBool = await authenticationService.signOut();
    return logOutBool;
  }

  Future<Either<Failure, AuthenticationEntity>> _signIn(
      String email, password) async {
    try {
      AuthenticationEntity authenticationEntity =
          await authenticationService.signIn(email, password);
      return Right(authenticationEntity);
    } catch (e) {
      return Left(AuthenticationFailure());
    }
  }

  Future<Either<Failure, AuthenticationEntity>> _signUp(
      String email, password) async {
    try {
      AuthenticationEntity authenticationEntity =
          await authenticationService.signUp(email, password);
      return Right(authenticationEntity);
    } catch (e) {
      return Left(AuthenticationFailure());
    }
  }

  Future<Either<Failure, bool>> _updateUser(
      String fullname, nickname, userId) async {
    try {
      UserEntity userEntity =
          UserEntity(name: fullname, username: nickname, uid: userId);
      bool done = await authenticationService.updateUser(userEntity);
      return Right(done);
    } catch (e) {
      return Left(AuthenticationFailure());
    }
  }

  @override
  Future<Either<Failure, UserCredential>> _signInWithFacebook() async {
    try {
      UserCredential userCredential =
          await authenticationService.signInWithFacebook();
      return Right(userCredential);
    } catch (e) {
      return Left(AuthenticationFailure());
    }
  }

  @override
  Future<Either<Failure, UserCredential>> _signInWithGoogle() async {
    try {
      UserCredential userCredential =
          await authenticationService.signInWithGoogle();
      return Right(userCredential);
    } catch (e) {
      return Left(AuthenticationFailure());
    }
  }
}
