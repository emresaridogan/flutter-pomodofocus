// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../entities/auth/authentication_entity.dart';
import '../../repository/auth/authentication_repository.dart';

class SignUpUseCase extends UseCase<AuthenticationEntity, SignUpUseCaseParams> {
  AuthenticationRepository authenticationRepository;
  SignUpUseCase({
    required this.authenticationRepository,
  });

  @override
  Future<Either<Failure, AuthenticationEntity>> call(
      SignUpUseCaseParams params) {
    return authenticationRepository.signUp(params.email, params.password);
  }
}

class SignUpUseCaseParams extends Equatable {
  String email;
  String password;

  SignUpUseCaseParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
