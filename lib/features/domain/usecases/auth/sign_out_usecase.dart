// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../repository/auth/authentication_repository.dart';

class SignOutUseCase {
  AuthenticationRepository authenticationRepository;
  SignOutUseCase({
    required this.authenticationRepository,
  });
  Future<bool> call() {
    return authenticationRepository.signOut();
  }
}
