import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_planner/life_cycle_handler.dart';
import 'package:school_planner/pages/calender_page.dart';
import 'package:school_planner/pages/grades_page.dart';
import 'package:school_planner/pages/new_assessment_page.dart';
import 'package:school_planner/pages/new_course_page.dart';
import 'package:school_planner/pages/new_student_page.dart';
import 'package:school_planner/pages/notes_page.dart';
import 'package:school_planner/pages/view_course_page.dart';
import 'package:school_planner/state_controller.dart';
import 'package:school_planner/themes.dart';
// import 'package:school_planner/routes.dart';
import 'package:school_planner/pages/home_page.dart';

void main() {
  // load data to state
  // Routes.createRoutes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppStateContainer(
      child: LifeCycleHandler(
        child: MaterialApp(
          
          title: 'School Planner',
          debugShowCheckedModeBanner: false,
          theme: CustomThemes.darkTheme,
          
          home: const HomePage(),
          
          initialRoute: '/',
          routes: {
            '/gradesPage'         : (context) => const GradesPage(),
            '/calenderPage'       : (context) => const CalenderPage(),
            '/newCoursePage'      : (context) => const NewCoursePage(),
            '/newStudentPage'     : (context) => const NewStudentPage(),
            '/newAssessmentPage'  : (context) => const NewAssessmentPage(courseId: 0),
            '/notesPage'          : (context) => const NotesPage(),
          }
        ),
      ),
    );
  }
}
