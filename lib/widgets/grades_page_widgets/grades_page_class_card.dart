import 'package:flutter/material.dart';
import 'package:school_planner/models/course.dart';
import 'package:school_planner/pages/view_course_page.dart';
import 'package:school_planner/themes.dart';


class GradesPageClassCard extends StatelessWidget {
  const GradesPageClassCard({
    super.key,
    required this.course,
  });

  final Course? course;

  @override
  Widget build(BuildContext context) {
    

    return GestureDetector(
      onTap:() {
        final localCourse = course;

        if( localCourse != null ){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ViewCoursePage(courseId: localCourse.id),
            ),
          );
        }
      },

      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Card(
          color: Color(0xFF3D3D3D),
    
          child: Padding(
            padding: const EdgeInsets.all(10.0),
        
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.text_snippet,
                  color: Color(0xFFC20430),
                  size: 50
                ),
        
                const Spacer(),
    
                Column(
                  mainAxisSize: MainAxisSize.min,
    
                  children: [
                    Text( course?.title ?? 'No title for this course', style: CustomTextStyles.headerTwo ),
                    Text( '${course?.hoursPerWeek ?? '-'} assessments', style: CustomTextStyles.subHeading ),
                  ],
                ),
        
                const Spacer( flex: 5),
    
                Text(
                  '${course?.hoursPerWeek ?? '-'}%',
                  style: const TextStyle(
                    fontSize: 25,
                  )
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}