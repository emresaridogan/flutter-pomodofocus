// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:pomodofocus/features/domain/usecases/task/create_task_usecase.dart';
import 'package:pomodofocus/features/domain/usecases/task/read_tasks_usecase.dart';

import '../../../domain/entities/task/task_entity.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  CreateTaskUseCase createTaskUseCase;
  ReadTasksUseCase readTasksUseCase;
  TaskBloc({
    required this.createTaskUseCase,
    required this.readTasksUseCase,
  }) : super(TaskLoading()) {
    on<CreateTaskButtonPressed>((event, emit) async {
      emit(TaskLoading());
      TaskEntity task = TaskEntity(
        uid: event.uid,
        title: event.title,
        category: event.category,
        countLongBreak: event.countLongBreak,
        countSession: event.countSession,
        countShortBreak: event.countShortBreak,
        date: event.date,
        time: event.time,
        id: event.id,
      );
      var result =
          await createTaskUseCase.call(CreateTaskUseCaseParams(task: task));
      result.fold(
          (r) => emit(TaskLoaded(tasks: [task])), (l) => emit(TaskFailure()));
    });

    on<GetAllTask>((event, emit) async {
      emit(TaskLoading());

      var result = await readTasksUseCase
          .call(ReadTasksUseCaseParams(uid: event.userId, date: event.date));
      result.fold(
          (l) => emit(TaskFailure()), (r) => emit(TaskLoaded(tasks: r)));
    });
  }
}
