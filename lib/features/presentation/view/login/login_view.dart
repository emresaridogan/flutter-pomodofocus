import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pomodofocus/core/base/state/base_state.dart';
import 'package:pomodofocus/core/base/view/base_view.dart';
import 'package:pomodofocus/features/presentation/bloc/auth/authentication_bloc.dart';
import 'package:pomodofocus/features/presentation/view/register/create_profile.dart';

import '../../../../core/components/buttons/button.dart';
import '../../../../core/components/buttons/icon_card.dart';

import '../../bloc/auth/authentication_event.dart';
import '../../bloc/auth/authentication_state.dart';
import '../register/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is AuthenticationLoading) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (state is Authenticated) {
        return const CreateProfile();
      } else if (state is AuthFailed) {
        return const LoginView();
      }

      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: colorConstants.whiteColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: colorConstants.whiteColor,
          leading: IconButton(onPressed: () {}, icon: iconConstants.arrowBack),
        ),
        body: BaseView(
          onPageBuilder: (context) => getBody,
        ),
      );
    });
  }

  Widget get getBody => Column(
        children: [
          Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    stringConstants.login,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          //form
          Expanded(
            flex: 7,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: radiusConstants.circular20,
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: iconConstants.email,
                        focusColor: colorConstants.blackColor,
                        filled: true,
                        fillColor: colorConstants.lightGrey,
                        labelText: stringConstants.email,
                        labelStyle: TextStyle(color: colorConstants.medGrey)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return stringConstants.emailError;
                      }
                      return null;
                    },
                    onSaved: (value) => emailController.text = value!,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    controller: passController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: radiusConstants.circular20,
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: iconConstants.lock,
                        suffixIcon: iconConstants.passwordHide,
                        filled: true,
                        fillColor: colorConstants.lightGrey,
                        labelText: stringConstants.password,
                        labelStyle: TextStyle(color: colorConstants.medGrey)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return stringConstants.passwordError;
                      }
                      return null;
                    },
                    onSaved: (value) => passController.text = value!,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.all(
                            colorConstants.secondaryColor),
                        value: true,
                        onChanged: (bool? value) {},
                      ),
                      Text(stringConstants.remember),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(
                        child: Button(
                            text: stringConstants.signin,
                            color: colorConstants.secondaryColor,
                            func: () {
                              BlocProvider.of<AuthenticationBloc>(context).add(
                                  SignInButtonPressed(
                                      email: emailController.text,
                                      password: passController.text));
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              stringConstants.forgotPass,
              style: TextStyle(
                  color: colorConstants.secondaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                  child: Divider(
                endIndent: 10.0,
                thickness: 2,
                color: colorConstants.lightGrey,
              )),
              Text(stringConstants.orWith),
              Expanded(
                  child: Divider(
                indent: 10.0,
                thickness: 2,
                color: colorConstants.lightGrey,
              )),
            ]),
          ),
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Expanded(
                  flex: 2,
                  child: IconCard(
                    func: () {
                      BlocProvider.of<AuthenticationBloc>(context)
                          .add(FacebookButtonPressed());
                    },
                    icon: SvgPicture.asset(
                      imageConstants.facebook,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 2,
                  child: IconCard(
                    func: (() {
                      BlocProvider.of<AuthenticationBloc>(context)
                          .add(GoogleButtonPressed());
                    }),
                    icon: SvgPicture.asset(
                      imageConstants.google,
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 2,
                  child: IconCard(
                    icon: SvgPicture.asset(
                      imageConstants.apple,
                    ),
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(stringConstants.dontHave),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: (() => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const RegisterView()))),
                  child: Text(
                    stringConstants.signup,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorConstants.secondaryColor),
                  ),
                )
              ],
            ),
          )
        ],
      );
}
