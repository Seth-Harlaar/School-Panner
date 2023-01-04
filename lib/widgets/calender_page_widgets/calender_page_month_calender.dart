import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderPageMonthCalender extends StatefulWidget {
  const CalenderPageMonthCalender({super.key});

  @override
  State<CalenderPageMonthCalender> createState() => _CalenderPageMonthCalenderState();
}

class _CalenderPageMonthCalenderState extends State<CalenderPageMonthCalender> {
  var _focusedDay = DateTime.now();
  var _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: _focusedDay,
    
      // make tappable on other days
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }
}