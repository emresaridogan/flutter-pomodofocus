import 'package:flutter/material.dart';
import 'package:pomodofocus/core/base/state/base_state.dart';
import 'package:pomodofocus/core/base/view/base_view.dart';

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
                const Spacer(),
                Expanded(
                  flex: 15,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              paddingConstants.paddingAll20),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: radiusConstants.circular20,
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              colorConstants.secondaryColor)),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const Onboard3View())),
                      child: Text(
                        stringConstants.next,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )),
                ),
                const Spacer()
              ],
            ),
          ),
        ]),
      );
}
