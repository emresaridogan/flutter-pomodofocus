import 'package:dartz/dartz.dart';
import 'package:pomodofocus/features/domain/entities/task/task_entity.dart';

import '../../../../core/error/failures.dart';
import '../../entities/user/user_entity.dart';

abstract class FirebaseRepository {
  // User Features
  Future<String> getCurrentUid();

  // Post Features
  Future<Either<Failure, bool>> createTask(TaskEntity task);
  Future<Either<Failure, List<TaskEntity>>> getTasks(String uid, date);
}
