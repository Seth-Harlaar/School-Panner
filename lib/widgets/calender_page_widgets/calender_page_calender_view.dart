import 'package:flutter/material.dart';
import 'package:school_planner/widgets/calender_page_widgets/calender_page_widgets.dart';

class CalenderPageCalenderView extends StatelessWidget {
  const CalenderPageCalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    // put the assessments on there as little dots below the day, expect the little dots are the 
    // assessment symbols in their corresponding course color
    return const CalenderPageMonthCalender();
  }
}