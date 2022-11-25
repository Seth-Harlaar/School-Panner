import 'package:flutter/material.dart';
import 'package:school_planner/widgets/assets/assets.dart';

class ViewCoursePageHeader extends StatelessWidget {
  const ViewCoursePageHeader({
    super.key, required this.courseTitle, required this.courseCode,
    this.curGrade = 85.2, this.absGrade = 56.7
  });

  final String courseTitle;
  final String courseCode;
  final double curGrade;
  final double absGrade;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),

      child: LargePrimaryCard(
          child: Column(
            children: [
              
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomHeader(
                          size: 0,
                          text: courseTitle.toUpperCase(),
                        ),
                        CustomHeader(
                          size: 1,
                          text: courseCode,
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.text_snippet,
                    color: Color(0xFFC20430),
                    size: 50
                  ),
                ],
              ),

              const SizedBox(height: 25),

              Column(
                children: [
                  Row(
                    children: [
                      const CustomSubHeading(
                        size: 2,
                        text: 'Current Grade:'
                      ),

                      const Spacer(),

                      SmallHighlightCardHollow(
                        child: Text(
                          '$curGrade%',
                        )
                      )
                    ]
                  ),
                  Row(
                    children: [
                      const CustomSubHeading(
                        size: 2,
                        text: 'Absolute Grade:'
                      ),

                      const Spacer(),

                      SmallHighlightCardHollow(
                        child: Text(
                          '$absGrade%',
                        )
                      )
                    ]
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}