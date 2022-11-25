import 'package:flutter/material.dart';
import 'package:school_planner/pages/new_assessment_page.dart';
import 'package:school_planner/widgets/assets/assets.dart';
import 'package:school_planner/widgets/new_assessment_form.dart';

class ViewCoursePageAssessSummary extends StatelessWidget {
  const ViewCoursePageAssessSummary({super.key, required this.ungradedAssessmentCount, required this.gradedAssessmentCount, required this.courseId});

  final int courseId;
  final int ungradedAssessmentCount;
  final int gradedAssessmentCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),

      child: Row(
        children: [
          Expanded(
            child: LargeSecondaryCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const CustomHeader(
                    size: 3,
                    text: 'Ungraded \nAssessments',
                  ),
                  Row(
                    children: [
                      CustomSubHeading(
                        size: 4,
                        text: '$ungradedAssessmentCount total',
                      ),
                      
                      const Spacer(),

                      ElevatedButton(
                        // navigate to new assessment page
                        onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => NewAssessmentPage(courseId: courseId),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFC72A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                          )
                        ),
                        child: const Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 5),
                          child:  Text(
                            'New',
                            style: TextStyle( fontSize: 15 ),
                          ),
                        ),
                      )

                    ],
                  )
                ],
              )  
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: LargePrimaryCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomHeader(
                    size: 3,
                    text: 'Graded \nAssessments',
                  ),
                  Row(
                    children: [
                      CustomSubHeading(
                        size: 4,
                        text: '$ungradedAssessmentCount total',
                      ),
                      
                      const Spacer(),

                      ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => NewAssessmentPage(courseId: courseId),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFC72A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)
                          )
                        ),
                        child: const Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 5),
                          child:  Text(
                            'New',
                            style: TextStyle( fontSize: 15 ),
                          ),
                        ),
                      )

                    ],
                  )
                ],
              )  
            ),
          )
        ],
      ),
    );
  }
}