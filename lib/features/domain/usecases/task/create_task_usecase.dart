// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../entities/task/task_entity.dart';
import '../../repository/firebase/firebase_repository.dart';

class CreateTaskUseCase extends UseCase<bool, CreateTaskUseCaseParams> {
  FirebaseRepository firebaseRepository;

  CreateTaskUseCase({
    required this.firebaseRepository,
  });

  @override
  Future<Either<Failure, bool>> call(CreateTaskUseCaseParams params) {
    return firebaseRepository.createTask(params.task);
  }
}

class CreateTaskUseCaseParams extends Equatable {
  TaskEntity task;

  CreateTaskUseCaseParams({
    required this.task,
  });

  @override
  List<Object?> get props => [task];
}
