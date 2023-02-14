import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pomodofocus/core/base/state/base_state.dart';
import 'package:pomodofocus/core/base/view/base_view.dart';

import '../../../../core/components/buttons/button.dart';
import '../../../../core/components/buttons/icon_button.dart';
import '../login/login_view.dart';
import '../register/register_view.dart';

class AccountSetup extends StatefulWidget {
  const AccountSetup({super.key});

  @override
  State<AccountSetup> createState() => _AccountSetupState();
}

class _AccountSetupState extends BaseState<AccountSetup> {
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
        onPageBuilder: (context) => getBody,
      ),
    );
  }

  Widget get getBody => Column(
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                stringConstants.accountSetupTitle,
                style:
                    const TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: ButtonWithIcon(
                        color: colorConstants.whiteColor,
                        text: stringConstants.continueFacebook,
                        icon: SvgPicture.asset(
                          imageConstants.facebook,
                          color: Colors.blue.shade700,
                        ),
                        func: () {},
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: dynamicHeight(0.02),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: ButtonWithIcon(
                        color: colorConstants.whiteColor,
                        text: stringConstants.continueGoogle,
                        icon: SvgPicture.asset(imageConstants.google),
                        func: () {},
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: dynamicHeight(0.02),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: ButtonWithIcon(
                        color: colorConstants.whiteColor,
                        text: stringConstants.continueApple,
                        icon: SvgPicture.asset(imageConstants.apple),
                        func: () {},
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(children: <Widget>[
              Expanded(
                  child: Divider(
                endIndent: 10.0,
                thickness: 2,
                color: colorConstants.lightGrey,
              )),
              Text(stringConstants.or),
              Expanded(
                  child: Divider(
                indent: 10.0,
                thickness: 2,
                color: colorConstants.lightGrey,
              )),
            ]),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: Button(
                    text: stringConstants.signInPass,
                    color: colorConstants.secondaryColor,
                    func: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const LoginView())),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
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
