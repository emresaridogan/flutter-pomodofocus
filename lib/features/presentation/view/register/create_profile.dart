import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodofocus/core/base/state/base_state.dart';
import 'package:pomodofocus/core/base/view/base_view.dart';
import 'package:pomodofocus/features/presentation/bloc/user/user_bloc.dart';
import 'package:pomodofocus/features/presentation/view/task/create_task.dart';

import '../../../../core/components/buttons/button.dart';
import '../../bloc/auth/authentication_bloc.dart';
import '../../bloc/auth/authentication_state.dart';
import '../../bloc/user/user_event.dart';
import '../splash/splash_view.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends BaseState<CreateProfile> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  late String userId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is Authenticated) {
        userId = state.uid;
      }
      return Scaffold(
        body: BaseView(
            viewModel: "",
            onPageBuilder: (context) => SingleChildScrollView(
                child: SizedBox(height: dynamicHeight(1), child: getBody))),
      );
    });
  }

  Widget get getBody => Column(
        children: [
          SizedBox(
            height: dynamicHeight(0.1),
          ),
          Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    stringConstants.fillProfile,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 40),
                  ),

                  Text(
                    stringConstants.changeLater,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),

                  // Image.asset(
                  //   imageConstants.person,
                  //   height: dynamicHeight(0.15),
                  // ),
                  SizedBox(
                    height: dynamicHeight(0.05),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      color: Colors.grey.shade200,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.person,
                          size: dynamicHeight(0.15),
                          color: Colors.grey.shade400),
                    ),
                  ),
                ],
              )),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: _fullName,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: radiusConstants.circular20,
                          borderSide: BorderSide.none,
                        ),
                        focusColor: colorConstants.blackColor,
                        filled: true,
                        fillColor: colorConstants.lightGrey,
                        labelText: stringConstants.fullName,
                        labelStyle: TextStyle(color: colorConstants.medGrey)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return stringConstants.emailError;
                      }
                      return null;
                    },
                    onSaved: (value) => _fullName.text = value!,
                  ),
                ),
                SizedBox(
                  height: dynamicHeight(0.01),
                ),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: _username,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: radiusConstants.circular20,
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: colorConstants.lightGrey,
                        labelText: stringConstants.nickname,
                        labelStyle: TextStyle(color: colorConstants.medGrey)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return stringConstants.nicknameError;
                      }
                      return null;
                    },
                    onSaved: (value) => _username.text = value!,
                  ),
                ),
                SizedBox(
                  height: dynamicHeight(0.01),
                ),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: radiusConstants.circular20,
                          borderSide: BorderSide.none,
                        ),
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
                    onSaved: (value) => _email.text = value!,
                  ),
                ),
                SizedBox(
                  height: dynamicHeight(0.01),
                ),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: _phoneNumber,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: radiusConstants.circular20,
                          borderSide: BorderSide.none,
                        ),
                        focusColor: colorConstants.blackColor,
                        filled: true,
                        fillColor: colorConstants.lightGrey,
                        labelText: stringConstants.phoneNumber,
                        labelStyle: TextStyle(color: colorConstants.medGrey)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return stringConstants.phoneNumberError;
                      }
                      return null;
                    },
                    onSaved: (value) => _phoneNumber.text = value!,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Button(
                          text: stringConstants.skip,
                          color: colorConstants.secondButtonColor,
                          textColor: colorConstants.secondaryColor,
                          func: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SplashView())),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 5,
                        child: Button(
                            text: stringConstants.start,
                            color: colorConstants.secondaryColor,
                            func: () {
                              BlocProvider.of<UserBloc>(context).add(
                                  UpdateUserButtonPressed(
                                      name: _fullName.text,
                                      username: _username.text,
                                      userId: userId));

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const CreateTask()));
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
