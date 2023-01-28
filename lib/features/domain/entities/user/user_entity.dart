import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  String? uid;
  String? username;
  String? name;
  String? email;
  String? password;

  UserEntity({
    this.uid,
    this.username,
    this.name,
    this.email,
    this.password,
  });

  @override
  List<Object?> get props => [
        uid,
        username,
        name,
        email,
        password,
      ];
}
