import 'package:flutter/material.dart';
import 'package:school_planner/widgets/app_bar.dart';
import 'package:school_planner/widgets/assets/assets.dart';
import 'package:school_planner/widgets/new_assessment_page_widgets/new_assessment_page_form.dart';


class NewAssessmentPage extends StatelessWidget {
  const NewAssessmentPage({super.key, required this.courseId});

  final int courseId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppToolBar(), 
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
          children: [
            const SizedBox(height: 25),
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
        
                  child: Column(
                    // shrinkWrap: true,
                    children: [
                      const CustomHeader(
                        size: 1,
                        text: 'Add a New Assessment'
                      ),
                      const SizedBox(height: 25),
                      Expanded(
                        child: NewAssessmentForm(courseId: courseId)
                      ),
                    ],
                  ),
              )
            )
          ],
        ),

    );
  }
}