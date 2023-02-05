part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();
}

class TaskLoading extends TaskState {
  @override
  List<Object> get props => [];
}

class TaskLoaded extends TaskState {
  final List<TaskEntity> tasks;

  const TaskLoaded({required this.tasks});
  @override
  List<Object> get props => [tasks];
}

class TaskFailure extends TaskState {
  @override
  List<Object> get props => [];
}
