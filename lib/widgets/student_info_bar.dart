import 'package:flutter/material.dart';
import 'package:school_planner/state_controller.dart';
import 'package:school_planner/models/student.dart';


class StudentInfoBar extends StatelessWidget {
  const StudentInfoBar({super.key});

  @override
  Widget build(BuildContext context) {
    final AppState? appState = AppStateContainer.of(context);
    
    final Student? student = appState?.student;

    return Row(
      
      children: [
        const Text(
          'Current student info:'
        ),
        Text(
          '   Name:  ${student?.name}',
        ),
        Text(
          '   Program:  ${student?.program}',
        ),
        Text(
          '   Year:  ${student?.year}',
        ),
      ],
    );
  }
}


  // final String _studentName;
  // final String _programName;
  // final int _currentYear;