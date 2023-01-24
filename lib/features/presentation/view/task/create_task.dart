import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodofocus/core/base/state/base_state.dart';
import 'package:pomodofocus/core/components/buttons/button.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/base/view/base_view.dart';
import '../../bloc/auth/authentication_bloc.dart';
import '../../bloc/auth/authentication_state.dart';
import '../../bloc/task/task_bloc.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends BaseState<CreateTask> {
  int _countShortBreak = 0;
  int _countWorkingSessions = 0;
  int _countLongBreak = 0;

  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  late String userId;

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
        appBar: AppBar(
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
        ),
        body: BaseView(
          viewModel: "",
          onPageBuilder: (context) => getBody,
        ),
      );
    });
  }

  Widget get getBody =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                stringConstants.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stringConstants.date,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    SizedBox(
                      height: dynamicHeight(0.02),
                    ),
                    TextFormField(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stringConstants.startTime,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    SizedBox(
                      height: dynamicHeight(0.02),
                    ),
                    TextFormField(
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
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                stringConstants.selectCategory,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                stringConstants.workingSessions,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
          ),
        ),
        Expanded(
            child: Column(
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
        )),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                stringConstants.shortBreak,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Button(
                  func: () {
                    BlocProvider.of<TaskBloc>(context).add(
                        CreateTaskButtonPressed(
                            category: categoryController.text,
                            countLongBreak: _countLongBreak,
                            countSession: _countWorkingSessions,
                            countShortBreak: _countShortBreak,
                            date: dateController.text,
                            time: timeController.text,
                            title: titleController.text,
                            uid: userId,
                            id: const Uuid().v1().toString()));
                  },
                  text: stringConstants.createTask,
                  color: colorConstants.secondaryColor,
                  textColor: colorConstants.whiteColor,
                ),
              ),
            ],
          ),
        )
      ]);
}
