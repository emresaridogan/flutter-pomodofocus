import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodofocus/core/base/state/base_state.dart';
import 'package:pomodofocus/features/presentation/view/onboard/onboard1_view.dart';
import 'package:pomodofocus/features/presentation/view/task/create_task.dart';

import '../../../data/models/auth/authentication_model.dart';
import '../../bloc/auth/authentication_bloc.dart';
import '../../bloc/auth/authentication_event.dart';
import '../../bloc/auth/authentication_state.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends BaseState<SplashView> {
  @override
  void initState() {
    super.initState();

    AuthenticationModel model;
    // User? user = FirebaseAuth.instance.currentUser;
    // model = AuthenticationModel.fromFirebaseUser(user);
    // print(model.userId);

    BlocProvider.of<AuthenticationBloc>(context).add(PageStarted());
    // 3 saniye sonra diğer sayfaya geçiş yapılacak
    // Timer(
    //     const Duration(seconds: 3),
    //     () => Navigator.push(
    //         context, MaterialPageRoute(builder: (_) => const Onboard1View())));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is AuthenticationLoading) {
        print(state);
        return scaffoldBody;
      } else if (state is Authenticated) {
        print(state.uid);

        return const CreateTask();
      } else if (state is UnAuthenticated) {
        print(state);

        return const Onboard1View();
      }
      print(state);

      return Container();
    });
  }

  Widget get scaffoldBody => Scaffold(
      backgroundColor: colorConstants.secondaryColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 2,
              ),
              Expanded(
                  child: Image.asset(
                imageConstants.logo,
                fit: BoxFit.contain,
              )),
              const Spacer(),
              CircularProgressIndicator(
                backgroundColor: colorConstants.primaryColor,
                valueColor: AlwaysStoppedAnimation(colorConstants.whiteColor),
              ),
              const Spacer()
            ],
          ),
        ],
      ));
}
