import 'package:flutter/material.dart';
import 'package:school_planner/models/course.dart';


class ViewCourseContent extends StatelessWidget {
  const ViewCourseContent({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    

    return Column(
      
      children: [
        const Text(
          'Course info:'
        ),
        Text(
          'Title:  ${course.title}',
        ),
        Text(
          'Course Code:  ${course.courseCode}',
        ),
        Text(
          'Hours Per Week:  ${course.hoursPerWeek}',
        ),
      ],
    );
  }
}
