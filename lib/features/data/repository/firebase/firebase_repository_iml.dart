import 'package:dartz/dartz.dart';
import 'package:pomodofocus/features/data/services/firebase/firebase_service.dart';
import 'package:pomodofocus/features/domain/entities/user/user_entity.dart';

import '../../../../core/error/failures.dart';
import '../../../domain/entities/task/task_entity.dart';
import '../../../domain/repository/firebase/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  FirebaseService firebaseService;

  FirebaseRepositoryImpl({
    required this.firebaseService,
  });

  @override
  Future<Either<Failure, bool>> createTask(TaskEntity task) {
    return _createTask(task);
  }

  Future<Either<Failure, bool>> _createTask(TaskEntity task) async {
    try {
      var call = await firebaseService.createTask(task);
      return Right(call);
    } catch (e) {
      return Left(AuthenticationFailure());
    }
  }

  @override
  Future<String> getCurrentUid() {
    // TODO: implement getCurrentUid
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getTasks(String uid, date) {
    return _getTasks(uid, date);
  }

  Future<Either<Failure, List<TaskEntity>>> _getTasks(String uid, date) async {
    try {
      var result = await firebaseService.getTasks(uid, date);
      return Right(result);
    } catch (e) {
      return Left(AuthenticationFailure());
    }
  }
}
