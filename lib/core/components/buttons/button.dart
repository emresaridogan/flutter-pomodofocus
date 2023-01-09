// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pomodofocus/core/base/state/base_state_stl.dart';

class Button extends StatelessWidget with BaseStateStl {
  final color;
  Color? textColor;
  VoidCallback? func;
  final text;

  Button({
    Key? key,
    this.textColor,
    this.func,
    this.color,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(paddingConstants.paddingAll20),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: radiusConstants.circular20,
              ),
            ),
            backgroundColor: MaterialStateProperty.all(color)),
        onPressed: func,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ));
  }
}
