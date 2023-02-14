// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:pomodofocus/features/domain/entities/task/task_entity.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../repository/firebase/firebase_repository.dart';

class ReadTasksUseCase
    extends UseCase<List<TaskEntity>, ReadTasksUseCaseParams> {
  final FirebaseRepository repository;

  ReadTasksUseCase({required this.repository});

  @override
  Future<Either<Failure, List<TaskEntity>>> call(
      ReadTasksUseCaseParams params) {
    return repository.getTasks(params.uid, params.date);
  }
}

class ReadTasksUseCaseParams extends Equatable {
  String uid;
  String date;
  ReadTasksUseCaseParams({
    required this.uid,
    required this.date,
  });

  @override
  List<Object?> get props => [uid, date];
}
