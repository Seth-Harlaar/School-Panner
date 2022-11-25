import 'package:flutter/material.dart';
import 'package:school_planner/database_controller.dart';
import 'package:school_planner/models/course.dart';
import 'package:school_planner/widgets/app_bar.dart';
import 'package:school_planner/widgets/view_course_content.dart';


class ViewCoursePage extends StatefulWidget {
  const ViewCoursePage({super.key, required this.courseId});

  final courseId;

  @override
  State<ViewCoursePage> createState() => _ViewCoursePageState();
}

class _ViewCoursePageState extends State<ViewCoursePage> {

  late Future<Course> pageCourse;

  @override
  void initState(){
    // get data for course
    final db = DbController();
    pageCourse = db.getCourse(widget.courseId);
  }

  @override
  Widget build(BuildContext context){

    return FutureBuilder(
      future: pageCourse,

      builder:(context, snapshot) {
        
        // on data retrieved
        if(snapshot.hasData){
          
          final inputCourse = snapshot.data;
          if( inputCourse != null){

            return Scaffold(
              appBar: const PreferredSize(
                preferredSize: Size.fromHeight(100),
                child: AppToolBar(), 
              ),
              body: ViewCourseContent(course: inputCourse)
            );
          }

        // on error
        } else if(snapshot.hasError){
          return Text('Error with future builder: ${snapshot.error}');
        }

        // while loading
        return const CircularProgressIndicator();
      },

      
    );
  }
}
