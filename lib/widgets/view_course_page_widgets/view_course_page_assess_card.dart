import 'package:flutter/material.dart';
import 'package:school_planner/models/assessment.dart';
import 'package:school_planner/models/course.dart';
import 'package:school_planner/themes.dart';
import 'package:school_planner/widgets/assets/assets.dart';

class ViewCoursePageAssessCard extends StatelessWidget {
  const ViewCoursePageAssessCard({super.key, required this.assessment});

  final Assessment assessment;

  @override
  Widget build(BuildContext context) {
    return LargePrimaryCard(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),

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
                Text( assessment.title, style: CustomTextStyles.headerTwo ),
                Text( '${assessment.weight} assessments', style: CustomTextStyles.subHeading ),
              ],
            ),
    
            const Spacer(),

            Text(
              '${assessment.assessmentType}',
              style: const TextStyle(
                fontSize: 25,
              )
            ),
          ],
        )
      ),
    );
  }
}