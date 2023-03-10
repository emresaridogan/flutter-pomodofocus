// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../repository/auth/authentication_repository.dart';

class SignInWithFacebookUseCase extends UseCase<UserCredential, NoParams> {
  AuthenticationRepository authenticationRepository;
  SignInWithFacebookUseCase({
    required this.authenticationRepository,
  });

  @override
  Future<Either<Failure, UserCredential>> call(NoParams params) {
    return authenticationRepository.signInWithFacebook();
  }
}
