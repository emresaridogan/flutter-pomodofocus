// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pomodofocus/core/base/state/base_state_stl.dart';

class IconCard extends StatelessWidget with BaseStateStl {
  Widget icon;
  final VoidCallback? func;

  IconCard({
    Key? key,
    required this.icon,
    this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: radiusConstants.circular20,
        ),
        child: Padding(padding: paddingConstants.paddingAll10, child: icon),
      ),
    );
  }
}
