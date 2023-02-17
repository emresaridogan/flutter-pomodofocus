import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pomodofocus/features/presentation/view/home/home_view.dart';
import 'package:pomodofocus/features/presentation/view/task/create_task.dart';

import '../../../../core/base/state/base_state.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends BaseState<MainView> {
  int _currentIndex = 0;

  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigationTapped(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorConstants.whiteColor,
        selectedItemColor: colorConstants.secondaryColor,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              imageConstants.homeSvg,
              width: dynamicWidth(0.08),
              color: isSelected(0),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              imageConstants.taskSvg,
              width: dynamicWidth(0.08),
              color: isSelected(1),
            ),
            label: "Task",
          ),
          BottomNavigationBarItem(
              label: "",
              icon: SvgPicture.asset(
                imageConstants.addSvg,
                width: dynamicWidth(0.12),
                color: isSelected(2),
              )),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              imageConstants.chartSvg,
              width: dynamicWidth(0.08),
              color: isSelected(3),
            ),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              imageConstants.profileSvg,
              color: isSelected(4),
              width: dynamicWidth(0.08),
            ),
            label: "Profile",
          ),
        ],
        onTap: navigationTapped,
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        children: const [HomeView(), HomeView(), CreateTask()],
      ),
    );
  }

  Color isSelected(int index) {
    return _currentIndex == index
        ? colorConstants.secondaryColor
        : colorConstants.medGrey;
  }
}
