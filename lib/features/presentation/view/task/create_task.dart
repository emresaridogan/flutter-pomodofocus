import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pomodofocus/core/base/state/base_state.dart';
import 'package:pomodofocus/core/components/buttons/button.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/base/view/base_view.dart';
import '../../bloc/auth/authentication_bloc.dart';
import '../../bloc/auth/authentication_state.dart';
import '../../bloc/task/task_bloc.dart';

class CreateTask extends StatefulWidget {
  PageController? pageController;
  CreateTask({this.pageController, super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends BaseState<CreateTask> {
  int _countShortBreak = 0;
  int _countWorkingSessions = 0;
  int _countLongBreak = 0;

  late TextEditingController titleController;
  late TextEditingController dateController;
  late TextEditingController timeController;
  late TextEditingController categoryController;
  late String userId;

  @override
  void initState() {
    timeController = TextEditingController();
    titleController = TextEditingController();
    dateController = TextEditingController();
    categoryController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is Authenticated) {
        userId = state.uid;
      }
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: colorConstants.whiteColor,
        appBar: appBarField(),
        body: BaseView(
          onPageBuilder: (context) => SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: dynamicHeight(1)),
                child: getBody),
          ),
        ),
      );
    });
  }

  AppBar appBarField() {
    return AppBar(
      elevation: 0,
      backgroundColor: colorConstants.whiteColor,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back,
          color: colorConstants.blackColor,
        ),
      ),
      title: Text(
        stringConstants.createTask,
        style: TextStyle(
            color: colorConstants.blackColor,
            fontWeight: FontWeight.bold,
            fontSize: 25),
      ),
    );
  }

  Widget get getBody =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: titleField(),
        ),
        Expanded(
          child: dateField(),
        ),
        Expanded(
          child: categoryField(),
        ),
        Expanded(
          child: workingSessionField(),
        ),
        Expanded(child: longBreakField()),
        Expanded(
          child: shortBreakField(),
        ),
        Expanded(
          child: createTaskButton(),
        )
      ]);

  Column titleField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stringConstants.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        SizedBox(
          height: dynamicHeight(0.02),
        ),
        TextFormField(
          controller: titleController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: radiusConstants.circular20,
                borderSide: BorderSide.none,
              ),
              focusColor: colorConstants.blackColor,
              filled: true,
              fillColor: colorConstants.lightGrey,
              labelText: stringConstants.taskTitle,
              labelStyle: TextStyle(color: colorConstants.medGrey)),
        ),
      ],
    );
  }

  Row dateField() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                stringConstants.date,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
                height: dynamicHeight(0.02),
              ),
              TextFormField(
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                      locale: const Locale('tr'),
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025));

                  if (selectedDate != null) {
                    setState(() {
                      dateController.text =
                          DateFormat('yyyy-MM-dd').format(selectedDate);
                    });
                  }
                },
                controller: dateController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: radiusConstants.circular20,
                      borderSide: BorderSide.none,
                    ),
                    focusColor: colorConstants.blackColor,
                    filled: true,
                    suffixIcon: const Icon(Icons.date_range_outlined),
                    fillColor: colorConstants.lightGrey,
                    labelText: stringConstants.date,
                    labelStyle: TextStyle(color: colorConstants.medGrey)),
              ),
            ],
          ),
        ),
        SizedBox(
          width: dynamicWidth(0.05),
        ),
        Expanded(
          child: startTimeField(),
        ),
      ],
    );
  }

  Column startTimeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stringConstants.startTime,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        SizedBox(
          height: dynamicHeight(0.02),
        ),
        TextFormField(
          onTap: () async {
            TimeOfDay? selectedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay(
                    hour: DateTime.now().hour, minute: DateTime.now().minute));
            if (selectedTime != null) {
              setState(() {
                final hour = selectedTime.hour.toString().padLeft(2, '0');
                final minute = selectedTime.minute.toString().padLeft(2, '0');
                timeController.text = "$hour:$minute";
              });
            }
          },
          controller: timeController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: radiusConstants.circular20,
                borderSide: BorderSide.none,
              ),
              focusColor: colorConstants.blackColor,
              suffixIcon: const Icon(Icons.access_time),
              filled: true,
              fillColor: colorConstants.lightGrey,
              labelText: stringConstants.startTime,
              labelStyle: TextStyle(color: colorConstants.medGrey)),
        ),
      ],
    );
  }

  Column categoryField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stringConstants.selectCategory,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        SizedBox(
          height: dynamicHeight(0.02),
        ),
        TextFormField(
          controller: categoryController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: radiusConstants.circular20,
                borderSide: BorderSide.none,
              ),
              focusColor: colorConstants.blackColor,
              filled: true,
              fillColor: colorConstants.lightGrey,
              labelText: stringConstants.category,
              labelStyle: TextStyle(color: colorConstants.medGrey)),
        ),
      ],
    );
  }

  Column workingSessionField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stringConstants.workingSessions,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        SizedBox(
          height: dynamicHeight(0.02),
        ),
        Slider(
          value: _countWorkingSessions.toDouble(),
          min: 0.0,
          max: 8.0,
          divisions: 8,
          activeColor: colorConstants.secondaryColor,
          inactiveColor: colorConstants.lightGrey,
          label: _countWorkingSessions.toString(),
          onChanged: (double newValue) {
            setState(() {
              _countWorkingSessions = newValue.round();
            });
          },
        )
      ],
    );
  }

  Column longBreakField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stringConstants.longBreak,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        SizedBox(
          height: dynamicHeight(0.02),
        ),
        Slider(
          value: _countLongBreak.toDouble(),
          min: 0.0,
          max: 30.0,
          divisions: 6,
          activeColor: colorConstants.secondaryColor,
          inactiveColor: colorConstants.lightGrey,
          label: _countLongBreak.toString(),
          onChanged: (double newValue) {
            setState(() {
              _countLongBreak = newValue.round();
            });
          },
        )
      ],
    );
  }

  Column shortBreakField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stringConstants.shortBreak,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        SizedBox(
          height: dynamicHeight(0.02),
        ),
        Slider(
          value: _countShortBreak.toDouble(),
          min: 0.0,
          max: 10.0,
          divisions: 10,
          activeColor: colorConstants.secondaryColor,
          inactiveColor: colorConstants.lightGrey,
          label: _countShortBreak.toString(),
          onChanged: (double newValue) {
            setState(() {
              _countShortBreak = newValue.round();
            });
          },
        )
      ],
    );
  }

  Row createTaskButton() {
    return Row(
      children: [
        Expanded(
          child: Button(
            func: () {
              String dateString =
                  "${dateController.text}T${timeController.text}:00.000Z";
              DateTime dateTime = DateTime.parse(dateString);
              Timestamp timestamp = Timestamp.fromDate(dateTime);
              BlocProvider.of<TaskBloc>(context).add(CreateTaskButtonPressed(
                  category: categoryController.text,
                  countLongBreak: _countLongBreak,
                  countSession: _countWorkingSessions,
                  countShortBreak: _countShortBreak,
                  date: timestamp,
                  dateString: dateController.text,
                  title: titleController.text,
                  uid: userId,
                  id: const Uuid().v1().toString()));

              widget.pageController!.jumpToPage(0);
              setState(() {});
            },
            text: stringConstants.createTask,
            color: colorConstants.secondaryColor,
            textColor: colorConstants.whiteColor,
          ),
        ),
      ],
    );
  }
}
