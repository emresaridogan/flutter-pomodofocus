// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pomodofocus/core/base/state/base_state_stl.dart';

class ButtonWithIcon extends StatelessWidget with BaseStateStl {
  final color;
  VoidCallback? func;
  final text;
  Widget icon;

  ButtonWithIcon({
    Key? key,
    this.func,
    required this.icon,
    this.color,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(paddingConstants.paddingAll20),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: radiusConstants.circular20,
              ),
            ),
            backgroundColor: MaterialStateProperty.all(color)),
        onPressed: () {
          func;
        },
        icon: icon,
        label: Text(
          text,
          style: const TextStyle(fontSize: 17, color: Colors.black),
        ));
  }
}
