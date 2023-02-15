import 'package:flutter/material.dart';

class MonthYearTitle extends StatelessWidget {
  MonthYearTitle({
    Key? key,
    required this.selectedDay,
  }) : super(key: key);

  final DateTime selectedDay;
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${months[selectedDay.month - 1]} ${selectedDay.year}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
