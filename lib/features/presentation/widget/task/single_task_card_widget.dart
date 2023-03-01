// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pomodofocus/features/presentation/widget/task/taskCardButton.dart';

import '../../../domain/entities/task/task_entity.dart';
import '../../../../core/base/state/base_state_stl.dart';

class SingleTaskCardWidget extends StatelessWidget with BaseStateStl {
  final TaskEntity task;
  SingleTaskCardWidget({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${task.date.toDate().hour.toString().padLeft(2, '0')}:${task.date.toDate().minute.toString().padLeft(2, '0')}",
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: colorConstants.blackColor,
                      fontWeight: FontWeight.w500),
                  fontSize: 15,
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 6,
          child: TaskCardButton(
            title: task.title,
            subtitle: task.category,
            color: colorConstants.secondaryColor,
            textColor: colorConstants.whiteColor,
          ),
        )
      ],
    );
  }
}
