import 'package:flutter/material.dart';
import 'package:school_planner/models/course.dart';
import 'package:school_planner/widgets/view_course_page_widgets/view_course_page_widgets.dart';


class ViewCourseContent extends StatelessWidget {
  const ViewCourseContent({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        ViewCoursePageHeader(courseTitle: course.title, courseCode: course.courseCode),

        ViewCoursePageAssessSummary(ungradedAssessmentCount: 0, gradedAssessmentCount: 0, courseId: course.id),

        ViewCoursePageAssessList(assessList: course.assessment.toList()),
      ],
    );
  }
}
