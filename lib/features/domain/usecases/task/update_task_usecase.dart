import '../../entities/task/task_entity.dart';
import '../../repository/firebase_repository.dart';

class UpdateTaskUseCase {
  final FirebaseRepository repository;

  UpdateTaskUseCase({required this.repository});

  Future<void> call(TaskEntity task) {
    return repository.updateTask(task);
  }
}
