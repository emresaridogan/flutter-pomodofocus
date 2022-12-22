import 'package:flutter/material.dart';
import 'package:pomodofocus/core/base/state/base_state.dart';
import 'package:pomodofocus/core/base/view/base_view.dart';
import 'package:pomodofocus/view/login/login_view.dart';

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
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const LoginView())),
                      child: Text(
                        stringConstants.onboard3button,
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
