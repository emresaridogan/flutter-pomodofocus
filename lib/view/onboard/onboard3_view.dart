import 'package:flutter/material.dart';
import 'package:pomodofocus/core/constants/color/color_constants.dart';
import 'package:pomodofocus/core/constants/image/image_constants.dart';

class Onboard3View extends StatelessWidget {
  const Onboard3View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Spacer(),
        Expanded(
          flex: 4,
          child: Image.asset(ImageConstants.instance.onboard3),
        ),
        Expanded(
          flex: 3,
          child: Row(
            children: const [
              Spacer(),
              Expanded(
                flex: 6,
                child: Text(
                  "Boost your productivity now & be successful",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              Spacer()
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
                      "Get Started",
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
