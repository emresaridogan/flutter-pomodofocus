import 'package:flutter/material.dart';
import 'package:pomodofocus/core/base/state/base_state.dart';
import 'package:pomodofocus/core/base/view/base_view.dart';

import '../../../../core/components/buttons/button.dart';
import 'onboard2_view.dart';

class Onboard1View extends StatefulWidget {
  const Onboard1View({super.key});

  @override
  State<Onboard1View> createState() => _Onboard1ViewState();
}

class _Onboard1ViewState extends BaseState<Onboard1View> {
  @override
  Widget build(BuildContext context) {
    return BaseView( onPageBuilder: ((context) => getScaffold));
  }

  Widget get getScaffold => Scaffold(
        backgroundColor: colorConstants.whiteColor,
        body: Column(children: [
          Expanded(
            flex: 3,
            child: Image.asset(imageConstants.onboard1),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    stringConstants.onboard1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 15,
                  child: Button(
                    func: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const Onboard2View())),
                    text: stringConstants.next,
                    color: colorConstants.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ]),
      );
}
