import 'package:flutter/material.dart';
import 'package:school_planner/widgets/app_bar.dart';
import 'package:school_planner/widgets/assets/assets.dart';
import 'package:school_planner/widgets/nav_bar.dart';
import 'package:school_planner/widgets/new_assessment_page_widgets/new_assessment_page_form.dart';


class NewAssessmentPage extends StatelessWidget {
  const NewAssessmentPage({super.key, required this.courseId});

  final int courseId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const CustomHeader(
            size: 1,
            text: 'Create a New Assessment'
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),

                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Expanded(
                      child: NewAssessmentForm(courseId: courseId)
                    ),
                  ],
                ),
              )
            )
          ],
        ),
      bottomNavigationBar: const NaVBar(),
    );
  }
}