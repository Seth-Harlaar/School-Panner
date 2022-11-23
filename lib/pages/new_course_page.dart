import 'package:flutter/material.dart';
import 'package:school_planner/widgets/app_bar.dart';
import 'package:school_planner/widgets/assets/assets.dart';
import 'package:school_planner/widgets/new_course_form.dart';


class NewCoursePage extends StatelessWidget {
  const NewCoursePage({super.key});

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
                      HeaderOne(text: 'New Course Info'),
                      SizedBox(height: 25),
                      NewCourseForm(),
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