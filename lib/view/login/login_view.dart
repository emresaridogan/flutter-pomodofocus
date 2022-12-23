import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pomodofocus/core/base/state/base_state.dart';
import 'package:pomodofocus/core/base/view/base_view.dart';
import 'package:pomodofocus/view/onboard/splash_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  final _formKey = GlobalKey<FormState>();

  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorConstants.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorConstants.whiteColor,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: colorConstants.blackColor,
          ),
        ),
      ),
      body: BaseView(
        viewModel: "",
        onPageBuilder: (context) => getBody,
      ),
    );
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: radiusConstants.circular20,
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(Icons.email),
                          focusColor: colorConstants.blackColor,
                          filled: true,
                          fillColor: colorConstants.lightGrey,
                          labelText: stringConstants.email,
                          labelStyle: TextStyle(color: colorConstants.medGrey)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return stringConstants.emailHata;
                        }
                        return null;
                      },
                      onSaved: (value) => _email = value!,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: radiusConstants.circular20,
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: const Icon(Icons.remove_red_eye),
                          filled: true,
                          fillColor: colorConstants.lightGrey,
                          labelText: stringConstants.password,
                          labelStyle: TextStyle(color: colorConstants.medGrey)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return stringConstants.passwordHata;
                        }
                        return null;
                      },
                      onSaved: (value) => _password = value!,
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
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      paddingConstants.paddingAll20),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: radiusConstants.circular20,
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                      colorConstants.secondaryColor)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const SplashView()));
                                // if (_formKey.currentState!.validate()) {
                                //   _formKey.currentState!.save();
                                //   print('Email: $_email');
                                //   print('Şifre: $_password');
                                // }
                              },
                              child: Text(
                                stringConstants.signin,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "Forgot the password?",
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
              const Text("or continue with"),
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
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: radiusConstants.circular20,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        imageConstants.facebook,
                        color: Colors.blue.shade700,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 2,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: radiusConstants.circular20,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        imageConstants.google,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 2,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: radiusConstants.circular20,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        imageConstants.apple,
                      ),
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
                const Text("Don't have account?"),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Sign up",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colorConstants.secondaryColor),
                )
              ],
            ),
          )
        ],
      );
}
