import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/user/user_entity.dart';

class UserModel extends UserEntity {
  @override
  final String? uid;
  @override
  final String username;
  @override
  final String? name;
  @override
  final String email;

  UserModel({
    this.uid,
    required this.username,
    this.name,
    required this.email,
  }) : super(
          uid: uid,
          username: username,
          name: name,
          email: email,
        );

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      email: snapshot['email'],
      name: snapshot['name'],
      username: snapshot['username'],
      uid: snapshot['uid'],
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
        "username": username,
      };
}
