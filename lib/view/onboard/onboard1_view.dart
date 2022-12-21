import 'package:flutter/material.dart';
import 'package:pomodofocus/core/constants/color/color_constants.dart';
import 'package:pomodofocus/core/constants/image/image_constants.dart';

class Onboard1View extends StatelessWidget {
  const Onboard1View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 3,
          child: Image.asset(ImageConstants.instance.onboard1),
        ),
        Expanded(
          child: Row(
            children: const [
              Spacer(),
              Expanded(
                flex: 4,
                child: Text(
                  "Easy task & work management with pomo",
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
