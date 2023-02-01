import '../../entities/task/task_entity.dart';
import '../../repository/firebase_repository.dart';

class ReadSingleTaskUseCase {
  final FirebaseRepository repository;

  ReadSingleTaskUseCase({required this.repository});

  Stream<List<TaskEntity>> call(String taskId) {
    return repository.readSingleTask(taskId);
  }
}
