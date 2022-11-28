import 'package:flutter/material.dart';
import 'package:school_planner/database_controller.dart';
import 'package:school_planner/models/assessment.dart';
import 'package:school_planner/models/course.dart';
import 'package:school_planner/widgets/view_course_page_widgets/view_course_page_widgets.dart';


class ViewCoursePageAssessList extends StatelessWidget {
  const ViewCoursePageAssessList({super.key, required this.assessList});

  final List<Assessment> assessList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ListView.builder(
          itemCount: assessList.length,
          shrinkWrap: true,
          itemBuilder:(context, index) {
            return ViewCoursePageAssessCard(assessment: assessList[index]);
          },
        ),
    );
  }
}