import 'package:flutter/material.dart';
import 'package:school_planner/models/assessment.dart';
import 'package:school_planner/models/course.dart';
import 'package:school_planner/pages/view_assessment_page.dart';
import 'package:school_planner/themes.dart';
import 'package:school_planner/widgets/assets/assets.dart';

// Replace with listtile

class ViewCoursePageAssessCard extends StatelessWidget {
  const ViewCoursePageAssessCard({super.key, required this.assessment});

  final Assessment assessment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ViewAssessmentPage(pageAssess: assessment),
          ),
        );
      },

      child: LargePrimaryCardNoPadding(
        child: ListTile(
          leading: assessmentIcon(assessment.assessmentType),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomHeader(
                    text: assessment.title,
                    size: 1,
                  ),
                  TinySecondaryCardHollow(
                    child: Text(
                      assessment.assessmentType.name,
                      style: const TextStyle(
                        fontSize: 18,
                      )
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomHeader(
                    text: 'Weight:',
                    size: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomHeader(
                      text: '${assessment.weight}%',
                      size: 3,
                    ),
                  )
                ],
              )
            ],
          )
          
        ),
      )

    );
  }
}