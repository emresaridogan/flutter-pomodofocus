// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../repository/authentication_repository.dart';

class UpdateUserUseCase extends UseCase<bool, UpdateUserUseCaseParams> {
  AuthenticationRepository authenticationRepository;
  UpdateUserUseCase({
    required this.authenticationRepository,
  });

  @override
  Future<Either<Failure, bool>> call(UpdateUserUseCaseParams params) {
    return authenticationRepository.updateUser(
        params.name, params.username, params.userId);
  }
}

class UpdateUserUseCaseParams extends Equatable {
  final String name, username, userId;

  const UpdateUserUseCaseParams(this.userId,
      {required this.name, required this.username});

  @override
  List<Object?> get props => [name, username, userId];
}
