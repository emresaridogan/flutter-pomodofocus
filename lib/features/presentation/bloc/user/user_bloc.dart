// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:pomodofocus/features/domain/usecases/auth/update_user_usecase.dart';
import 'package:pomodofocus/features/presentation/bloc/user/user_event.dart';
import 'package:pomodofocus/features/presentation/bloc/user/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UpdateUserUseCase updateUserUseCase;

  UserBloc({required this.updateUserUseCase}) : super(UserInitial()) {
    on<UpdateUserButtonPressed>((event, emit) async {
      emit(UserLoading());
      try {
        await updateUserUseCase.call(UpdateUserUseCaseParams(
            name: event.name, username: event.username, event.userId));
        // emit(LoginSuccess());
      } catch (error) {
        emit(UserFailure(error: error.toString()));
      }
    });
  }
}
