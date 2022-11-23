import 'package:flutter/material.dart';
import 'package:school_planner/themes.dart';


class GradesPageClassCard extends StatelessWidget {
  const GradesPageClassCard({
    super.key,
    required this.courseTitle,
    required this.assessCount,
    required this.grade
  });

  final String? courseTitle;
  final int assessCount;
  final double grade;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  Text( courseTitle ?? 'asdf', style: CustomTextStyles.headerTwo ),
                  Text( '$assessCount assessments', style: CustomTextStyles.subHeading ),
                ],
              ),
      
              const Spacer( flex: 5),

              Text(
                '$grade%',
                style: const TextStyle(
                  fontSize: 25,
                )
              ),
      
      
            ],
            
          )
        ),
      ),
    );
  }
}