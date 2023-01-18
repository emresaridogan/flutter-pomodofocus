import 'package:flutter/material.dart';
import 'package:pomodofocus/core/base/state/base_state.dart';
import 'package:pomodofocus/core/components/buttons/button.dart';

import '../../../../core/base/view/base_view.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends BaseState<CreateTask> {
  int _value = 0;
  int _value1 = 0;
  int _value2 = 0;

  @override
  Widget build(BuildContext context) {
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
                value: _value1.toDouble(),
                min: 0.0,
                max: 8.0,
                divisions: 8,
                activeColor: colorConstants.secondaryColor,
                inactiveColor: colorConstants.lightGrey,
                label: _value1.toString(),
                onChanged: (double newValue) {
                  setState(() {
                    _value1 = newValue.round();
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
              value: _value2.toDouble(),
              min: 0.0,
              max: 30.0,
              divisions: 6,
              activeColor: colorConstants.secondaryColor,
              inactiveColor: colorConstants.lightGrey,
              label: _value2.toString(),
              onChanged: (double newValue) {
                setState(() {
                  _value2 = newValue.round();
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
                value: _value.toDouble(),
                min: 0.0,
                max: 10.0,
                divisions: 10,
                activeColor: colorConstants.secondaryColor,
                inactiveColor: colorConstants.lightGrey,
                label: _value.toString(),
                onChanged: (double newValue) {
                  setState(() {
                    _value = newValue.round();
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
