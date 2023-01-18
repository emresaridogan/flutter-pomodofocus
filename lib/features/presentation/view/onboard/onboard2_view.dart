import 'package:flutter/material.dart';
import 'package:pomodofocus/core/base/state/base_state.dart';
import 'package:pomodofocus/core/base/view/base_view.dart';

import '../../../../core/components/buttons/button.dart';
import 'onboard3_view.dart';

class Onboard2View extends StatefulWidget {
  const Onboard2View({super.key});

  @override
  State<Onboard2View> createState() => _Onboard2ViewState();
}

class _Onboard2ViewState extends BaseState<Onboard2View> {
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
            child: Image.asset(imageConstants.onboard2),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Text(
                    stringConstants.onboard2,
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
                            builder: (_) => const Onboard3View())),
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
