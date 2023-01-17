import 'package:flutter/material.dart';
import 'package:school_planner/models/course.dart';
import 'package:school_planner/pages/view_course_page.dart';
import 'package:school_planner/widgets/assets/assets.dart';


// Replace with listtile

class GradesPageClassCard extends StatelessWidget {
  const GradesPageClassCard({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context){

    return GestureDetector(
      onTap:() {
        final localCourse = course;

        if( localCourse != null ){
          Navigator.of(context).push(
            MaterialPageRoute(
              // change to send the whole course instead of just the id
              builder: (context) => ViewCoursePage(courseId: localCourse.id),
            ),
          );
        }
      },

      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        color: const Color(0xFF3D3D3D),

        child: ListTile(
          leading: const Icon(
            Icons.text_snippet,
            color: Color(0xFFC20430),
            size: 50
          ),

          title: CustomHeader(
            text: course.title,
            size: 1,
          ),

          subtitle: CustomHeader(
            text: '${course.hoursPerWeek} assessments',
            size: 2,
          ),

          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomHeader(
                text: '${course.curGrade}%',
                size: 2,
              )
            ]
          ),
        )
      )
    );
  }
}