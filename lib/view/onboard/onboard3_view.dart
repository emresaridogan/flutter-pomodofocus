import 'package:flutter/material.dart';
import 'package:pomodofocus/core/base/state/base_state.dart';
import 'package:pomodofocus/core/base/view/base_view.dart';
import 'package:pomodofocus/view/account/account_setup.dart';

import '../../core/components/buttons/button.dart';

class Onboard3View extends StatefulWidget {
  const Onboard3View({super.key});

  @override
  State<Onboard3View> createState() => _Onboard3ViewState();
}

class _Onboard3ViewState extends BaseState<Onboard3View> {
  @override
  Widget build(BuildContext context) {
    return BaseView(viewModel: "", onPageBuilder: ((context) => getScaffold));
  }

  Widget get getScaffold => Scaffold(
        backgroundColor: colorConstants.whiteColor,
        body: Column(children: [
          const Spacer(),
          Expanded(
            flex: 4,
            child: Image.asset(imageConstants.onboard3),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Text(
                    stringConstants.onboard3,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 15,
                  child: Button(
                    func: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const AccountSetup())),
                    text: stringConstants.onboard3button,
                    color: colorConstants.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ]),
      );
}
