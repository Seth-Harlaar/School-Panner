import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:school_planner/database_controller.dart';
import 'package:school_planner/models/course.dart';
import 'grades_page_widgets.dart';

class GradesPageClassList extends StatefulWidget {
  const GradesPageClassList({super.key});

  @override
  State<GradesPageClassList> createState() => _GradesPageClassListState();
}

class _GradesPageClassListState extends State<GradesPageClassList> {
  final List<String> courses = const ['Engineering', 'Philosophy', 'English', 'Chemistry'];

  late Future<List<Course>> courseList;

  @override
  void initState(){
    super.initState();
    
    // get required info
    final db = DbController();
    courseList = db.getAllCourses();
  }

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: FutureBuilder<List<Course>>(
        future: courseList,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.length,
              shrinkWrap: true,
              itemBuilder:(context, index) {
                final course = snapshot.data?[index];
                return GradesPageClassCard(courseTitle: course?.title, assessCount: 1, grade: 85.6);
              },
            );
            
          } else if (snapshot.hasError){
            return Text('Error with future builder: ${snapshot.error}');
          }

          return const CircularProgressIndicator();
        }
      ),
    );
  }
}
