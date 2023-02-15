// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pomodofocus/core/base/state/base_state_stl.dart';

class TaskCardButton extends StatelessWidget with BaseStateStl {
  final color;
  Color? textColor;
  VoidCallback? func;
  final title;
  final subtitle;

  TaskCardButton({
    Key? key,
    this.textColor,
    this.func,
    this.color,
    this.title,
    this.subtitle,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: colorConstants.whiteColor),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: colorConstants.whiteColor),
                      fontSize: 15,
                      fontStyle: FontStyle.italic),
                )
              ],
            ),
          ],
        ));
  }
}
