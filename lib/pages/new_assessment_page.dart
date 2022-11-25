import 'package:flutter/material.dart';
import 'package:school_planner/widgets/app_bar.dart';
import 'package:school_planner/widgets/assets/assets.dart';
import 'package:school_planner/widgets/new_assessment_form.dart';


class NewAssessmentPage extends StatelessWidget {
  const NewAssessmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppToolBar(), 
      ),
      
      body: Column(
          children: [
            const SizedBox(height: 25),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LargePrimaryCard(
                childWidget: Padding(
                  padding: const EdgeInsets.all(8.0),

                  child: Column(
                    children: const [
                      HeaderOne(text: 'Add a New Assessment'),
                      SizedBox(height: 25),
                      NewAssessmentForm(),
                    ],
                  )
                )
              ),
            )
          ],
        ),

    );
  }
}