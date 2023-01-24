// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../entities/auth/authentication_entity.dart';
import '../../repository/auth/authentication_repository.dart';

class SignInUseCase extends UseCase<AuthenticationEntity, SignInUseCaseParams> {
  AuthenticationRepository authenticationRepository;
  SignInUseCase({
    required this.authenticationRepository,
  });

  @override
  Future<Either<Failure, AuthenticationEntity>> call(
      SignInUseCaseParams params) {
    return authenticationRepository.signIn(params.email, params.password);
  }
}

class SignInUseCaseParams extends Equatable {
  final String email;
  final String password;

  const SignInUseCaseParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
