import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            color: Colors.green,
            onPressed: () {
              List<String> months = getMonthsAndDates();
              for (int i = 0; i < months.length; i++) {
                debugPrint('MONTHS___________${months[i]}');
                List<String> dates = getDatesOfMonth("May 2023");
                for (int j = 0; j < dates.length; j++) {
                  debugPrint('Date_________${dates[j]}');
                }
              }
            },
            child: const Text('Test'),
          ),
        ],
      ),
    );
  }

  List<String> getMonthsAndDates() {
    DateTime currentDate = DateTime(DateTime.now().year, DateTime.now().month);
    List<String> monthsAndDates = [];

    for (int i = 0; i < 6; i++) {
      String formattedMonthAndYear =
          DateFormat('MMMM yyyy').format(currentDate);
      monthsAndDates.add(formattedMonthAndYear);
      currentDate = DateTime(currentDate.year, currentDate.month + 1);
    }

    return monthsAndDates;
  }

  List<String> getDatesOfMonth(String month) {
    DateFormat dateFormat = DateFormat('MMM yyyy');
    DateFormat dateDayFormat = DateFormat('E d');

    DateTime currentMonth = dateFormat.parse(month);
    DateTime currentDate = DateTime.now();

    if (currentMonth.year == currentDate.year &&
        currentMonth.month == currentDate.month) {
      DateTime lastDayOfMonth =
          DateTime(currentMonth.year, currentMonth.month + 1, 0);
      List<String> dates = [];

      while (currentDate.isBefore(lastDayOfMonth)) {
        String formattedDate = dateDayFormat.format(currentDate);
        dates.add(formattedDate);
        currentDate = currentDate.add(const Duration(days: 1));
      }

      return dates;
    } else {
      DateTime firstDayOfMonth =
          DateTime(currentMonth.year, currentMonth.month);
      DateTime lastDayOfMonth =
          DateTime(currentMonth.year, currentMonth.month + 1, 0);
      List<String> dates = [];

      for (DateTime date = firstDayOfMonth;
          date.isBefore(lastDayOfMonth);
          date = date.add(const Duration(days: 1))) {
        String formattedDate = dateDayFormat.format(date);
        dates.add(formattedDate);
      }

      return dates;
    }
  }
}
