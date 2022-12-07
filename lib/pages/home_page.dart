import 'package:flutter/material.dart';
import 'package:school_planner/pages/layouts/home_layout.dart';
import 'package:school_planner/pages/layouts/home_medium_layout.dart';
import 'package:school_planner/state_controller.dart';
import 'package:school_planner/widgets/nav_bar.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> sampleTitles = const ['Grades', 'Notes', 'Settings', 'Calendar', 'Charts Page', 'New Course', 'New Student', 'New Assessment'];
  final List<String> sampleLocations = const['/gradesPage', '/notesPage', 'Settings', '/calenderPage', 'charts', '/newCoursePage', '/newStudentPage', '/newAssessmentPage'];

  Widget build(BuildContext context){
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: LayoutBuilder(
          builder:(BuildContext context, BoxConstraints constraints) {
            // small
            if( constraints.maxWidth <= 730 ){
              return HomeLayout( routeTitles: sampleTitles, routeLocations: sampleLocations);
            // wide
            } else {
              return HomeMediumLayout( routeTitles: sampleTitles, routeLocations: sampleLocations);
            }
          },
        ),
      ),

      bottomNavigationBar: const NaVBar(),
    );
  }
}
