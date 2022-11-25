import 'package:flutter/material.dart';
import 'package:school_planner/models/student.dart';
import 'package:school_planner/widgets/app_bar.dart';
import 'package:school_planner/widgets/assets/assets.dart';
import 'package:school_planner/widgets/new_student_form.dart';
import 'package:school_planner/widgets/student_info_bar.dart';


class NewStudentPage extends StatelessWidget {
  const NewStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppToolBar(), 
      ),
      
      body: Column(
        children: const [
          SizedBox(height: 25),
          StudentInfoBar(),
          SizedBox(height: 25),
        
          Padding(
          padding: EdgeInsets.all(8.0),
            child: LargePrimaryCard(
              child: Padding(
                padding: EdgeInsets.all(8.0),

                // new student form
                child: Center(
                  child: NewStudentForm(),
                )
              )
            ),
          )
        ],
      ),
    );
  }
}