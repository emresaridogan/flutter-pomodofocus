import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pomodofocus/core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../bloc/task/task_bloc.dart';
import '../../widget/task/taskCardButton.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
  late String uid;
  late DateTime selectedDay;

  @override
  void initState() {
    selectedDay = DateTime.now();
    BlocProvider.of<TaskBloc>(context).add(GetAllTask(
        date:
            "${selectedDay.year.toString()}-${selectedDay.month.toString().padLeft(2, '0')}-${selectedDay.day.toString().padLeft(2, '0')}",
        userId: "O5TbWBjD8bOs58wh1JkuICvrCwt1"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TaskLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TaskLoaded) {
          return Scaffold(
              appBar: appBarField(),
              body: BaseView(
                onPageBuilder: (context) => getBody(context),
              ));
        }
        return const SizedBox();
      },
    );
  }

  AppBar appBarField() {
    return AppBar(
      backgroundColor: colorConstants.whiteColor,
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
            'Pomodofocus',
            style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: colorConstants.blackColor,
                  fontWeight: FontWeight.w600),
              fontSize: 20,
            ),
          ),
          Icon(
            Icons.search,
            color: colorConstants.blackColor,
          )
        ],
      ),
    );
  }

  Column getBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 15,
          child: Column(
            children: [
              chartField(context),
              SizedBox(
                height: dynamicHeight(0.02),
              ),
              Expanded(
                flex: 6,
                child: textsField(context),
              )
            ],
          ),
        )
      ],
    );
  }

  Column textsField(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today Tasks",
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: colorConstants.blackColor,
                      fontWeight: FontWeight.w600),
                  fontSize: 18,
                ),
              ),
              Text(
                "See all",
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: colorConstants.secondaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 10,
          child: BlocBuilder<TaskBloc, TaskState>(builder: ((context, state) {
            if (state is TaskLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TaskLoaded) {
              return state.tasks.isEmpty
                  ? _noTasksYetWidget()
                  : taskBuilder(state);
            }
            return _noTasksYetWidget();
          })),
        ),
      ],
    );
  }

  ListView taskBuilder(TaskLoaded state) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: state.tasks.length,
      itemBuilder: (context, index) {
        final task = state.tasks[index];
        return Padding(
          padding: EdgeInsets.only(bottom: dynamicHeight(0.01)),
          child: TaskCardButton(
            title: task.title,
            subtitle: task.category,
            color: colorConstants.primaryColor,
            textColor: colorConstants.whiteColor,
          ),
        );
      },
    );
  }

  Expanded chartField(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: chartIndicatorField(),
          ),
          SizedBox(
            width: dynamicWidth(0.03),
          ),
          Expanded(flex: 3, child: chartTextField(context)),
        ],
      ),
    );
  }

  Text chartTextField(BuildContext context) {
    return Text(
      "Wow! Your daily goals is almost done!",
      style: GoogleFonts.poppins(
        textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: colorConstants.blackColor, fontWeight: FontWeight.w600),
        fontSize: 18,
      ),
    );
  }

  CircularPercentIndicator chartIndicatorField() {
    return CircularPercentIndicator(
      progressColor: colorConstants.secondaryColor,
      radius: 60.0,
      lineWidth: 13.0,
      animation: true,
      percent: 0.75,
      center: const Text(
        "75%",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
    );
  }

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
}
