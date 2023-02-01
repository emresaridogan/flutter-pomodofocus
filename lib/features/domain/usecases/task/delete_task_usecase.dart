import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pomodofocus/core/usecases/usecase.dart';
import 'package:pomodofocus/features/domain/entities/task/task_entity.dart';

import '../../../../core/error/failures.dart';
import '../../repository/firebase_repository.dart';

class DeleteTaskUseCase extends UseCase<bool, DeleteTaskUseCaseParams> {
  final FirebaseRepository repository;

  DeleteTaskUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(DeleteTaskUseCaseParams params) {
    return repository.deleteTask(params.task);
  }
}

class DeleteTaskUseCaseParams extends Equatable {
  TaskEntity task;

  DeleteTaskUseCaseParams({
    required this.task,
  });

  @override
  List<Object?> get props => [task];
}
