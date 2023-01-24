// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../entities/auth/authentication_entity.dart';
import '../../repository/authentication_repository.dart';

class GetCurrentUserUseCase extends UseCase<AuthenticationEntity, NoParams> {
  AuthenticationRepository authenticationRepository;
  GetCurrentUserUseCase({
    required this.authenticationRepository,
  });

  @override
  Future<Either<Failure, AuthenticationEntity>> call(NoParams params) {
    return authenticationRepository.getCurrentUser();
  }
}
