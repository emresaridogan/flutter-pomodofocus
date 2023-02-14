import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failures.dart';
import '../../entities/auth/authentication_entity.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, AuthenticationEntity>> getCurrentUser();

  Future<Either<Failure, AuthenticationEntity>> signUp(String email, password);

  Future<Either<Failure, AuthenticationEntity>> signIn(String email, password);
  Future<Either<Failure, bool>> updateUser(String fullname, nickname, uid);
  Future<Either<Failure, UserCredential>> signInWithFacebook();
  Future<Either<Failure, UserCredential>> signInWithGoogle();

  Future<bool> signOut();
}
