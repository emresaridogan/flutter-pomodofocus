import 'package:flutter/material.dart';
import 'package:pomodofocus/core/constants/color/color_constants.dart';
import 'package:pomodofocus/core/constants/image/image_constants.dart';

class Onboard2View extends StatelessWidget {
  const Onboard2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Spacer(),
        Expanded(
          flex: 2,
          child: Image.asset(ImageConstants.instance.onboard2),
        ),
        Expanded(
          child: Row(
            children: const [
              Spacer(),
              Expanded(
                flex: 6,
                child: Text(
                  "Track your productivity & gain insights",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              Spacer()
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 15,
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.all(20.0)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            ColorConstants.instance.secondaryColor)),
                    onPressed: () {},
                    child: const Text(
                      "Next",
                      style: TextStyle(
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
}
