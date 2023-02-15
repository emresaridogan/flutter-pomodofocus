import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodofocus/core/base/state/base_state.dart';
import 'package:pomodofocus/core/base/view/base_view.dart';
import 'package:pomodofocus/features/presentation/bloc/auth/authentication_bloc.dart';
import 'package:pomodofocus/features/presentation/bloc/task/task_bloc.dart';

import '../../widget/home/single_task_card_widget.dart';
import '../../../../core/components/date/date_picker.dart';
import '../../bloc/auth/authentication_event.dart';
import '../../bloc/auth/authentication_state.dart';
import '../../widget/home/month_year_title.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
  late DateTime selectedDay;
  late String uid, day, month, year;
  @override
  void initState() {
    BlocProvider.of<AuthenticationBloc>(context).add(PageStarted());
    selectedDay = DateTime.now();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: ((context, state) {
          if (state is Authenticated) {
            uid = state.uid;
            BlocProvider.of<TaskBloc>(context).add(GetAllTask(
                date:
                    "${selectedDay.day.toString().padLeft(2, '0')}.${selectedDay.month.toString().padLeft(2, '0')}.${selectedDay.year.toString()}",
                userId: uid));
          }
        }),
        child: Scaffold(
            backgroundColor: colorConstants.whiteColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    imageConstants.logo,
                    fit: BoxFit.cover,
                    scale: 4,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                        color: colorConstants.blackColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.search,
                    color: colorConstants.blackColor,
                  )
                ],
              ),
            ),
            body: BaseView(
              onPageBuilder: (context) => SingleChildScrollView(
                  physics: const ScrollPhysics(), child: column),
            )));
  }

  Widget get column => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          MonthYearTitle(selectedDay: selectedDay),
          datePicker(context),
          BlocBuilder<TaskBloc, TaskState>(builder: ((context, state) {
            if (state is TaskLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TaskLoaded) {
              return state.tasks.isEmpty
                  ? _noTasksYetWidget()
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.tasks.length,
                      itemBuilder: (context, index) {
                        final task = state.tasks[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: dynamicHeight(0.01)),
                          child: SingleTaskCardWidget(task: task),
                        );
                      },
                    );
            }
            return _noTasksYetWidget();
          }))
        ],
      );

  Column _noTasksYetWidget() {
    return Column(
      children: [
        Image.asset(imageConstants.home),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You have no task today!",
              style: TextStyle(
                  fontSize: 20,
                  color: colorConstants.secondaryColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: dynamicHeight(0.02),
            ),
            const Text("Click the (+) icon to add a new task",
                style: TextStyle(fontSize: 15))
          ],
        ),
      ],
    );
  }

  Widget datePicker(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: DatePicker(
          selectedDay: selectedDay,
          changeDay: (value) {
            setState(() {
              selectedDay = value;
            });

            BlocProvider.of<TaskBloc>(context).add(GetAllTask(
                date:
                    "${selectedDay.day.toString().padLeft(2, '0')}.${selectedDay.month.toString().padLeft(2, '0')}.${selectedDay.year.toString()}",
                userId: uid));
          },
          enableWeeknumberText: false,
          backgroundColor: Colors.white,
          digitsColor: Colors.black,
          selectedBackgroundColor: colorConstants.secondaryColor,
          selectedDigitColor: Colors.blue,
          weekdays: const ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
          daysInWeek: 7),
    );
  }
}
