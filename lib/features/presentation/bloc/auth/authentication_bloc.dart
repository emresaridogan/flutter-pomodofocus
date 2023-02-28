import 'package:bloc/bloc.dart';
import 'package:pomodofocus/core/usecases/usecase.dart';

import '../../../domain/usecases/auth/get_current_user_usecase.dart';
import '../../../domain/usecases/auth/sign_in_usecase.dart';
import '../../../domain/usecases/auth/sign_in_with_facebook_usecase.dart';
import '../../../domain/usecases/auth/sign_in_with_google_usecase.dart';
import '../../../domain/usecases/auth/sign_out_usecase.dart';

import '../../../domain/usecases/auth/sign_up_usecase.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  SignOutUseCase signOutUseCase;
  GetCurrentUserUseCase getCurrentUserUseCase;
  SignInUseCase signInUseCase;
  SignUpUseCase signUpUseCase;
  SignInWithFacebookUseCase signInWithFacebookUseCase;
  SignInWithGoogleUseCase signInWithGoogleUseCase;

  AuthenticationBloc(
      {required this.signOutUseCase,
      required this.getCurrentUserUseCase,
      required this.signInUseCase,
      required this.signInWithFacebookUseCase,
      required this.signInWithGoogleUseCase,
      required this.signUpUseCase})
      : super(AuthenticationLoading()) {
    on<PageStarted>((event, emit) async {
      emit(AuthenticationLoading());
      var result = await getCurrentUserUseCase.call(NoParams());
      result.fold((l) => emit(UnAuthenticated(error: l.toString())),
          (r) => emit(Authenticated(uid: r.userId)));
    });
    on<SignOutButtonPressed>((event, emit) async {
      emit(AuthenticationLoading());

      var call = await signOutUseCase.call();
      if (call) emit(UnAuthenticated(error: ""));
    });

    on<SignUpButtonPressed>((event, emit) async {
      emit(AuthenticationLoading());
      var call = await signUpUseCase.call(
          SignUpUseCaseParams(email: event.email, password: event.password));
      call.fold((l) {
        emit(UnAuthenticated(error: l.toString()));
      }, ((r) {
        emit(Authenticated(uid: r.userId));
      }));
    });

    on<SignInButtonPressed>((event, emit) async {
      emit(AuthenticationLoading());
      var call = await signInUseCase.call(
          SignInUseCaseParams(email: event.email, password: event.password));
      call.fold((l) {
        emit(UnAuthenticated(error: l.toString()));
      }, ((r) {
        emit(Authenticated(uid: r.userId));
      }));
    });

    on<FacebookButtonPressed>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        await signInWithFacebookUseCase.call(NoParams());
        // emit(LoginSuccess());
      } catch (error) {
        emit(UnAuthenticated(error: error.toString()));
      }
    });

    on<GoogleButtonPressed>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        var call = await signInWithGoogleUseCase.call(NoParams());
        call.fold((l) {
          emit(UnAuthenticated(error: l.toString()));
        }, ((r) {
          emit(Authenticated(uid: r.user!.uid));
        }));
      } catch (error) {}
    });
  }
}
