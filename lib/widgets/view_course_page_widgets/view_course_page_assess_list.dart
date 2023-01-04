import 'package:flutter/material.dart';
import 'package:school_planner/database_controller.dart';
import 'package:school_planner/models/assessment.dart';
import 'package:school_planner/models/course.dart';
import 'package:school_planner/widgets/view_course_page_widgets/view_course_page_widgets.dart';


class ViewCoursePageAssessList extends StatefulWidget {
  const ViewCoursePageAssessList({super.key, required this.course});

  // final List<Assessment> assessList;
  final Course course;

  @override
  State<ViewCoursePageAssessList> createState() => _ViewCoursePageAssessListState();
}

class _ViewCoursePageAssessListState extends State<ViewCoursePageAssessList> {

  late Future<List<Assessment>> assessmentList;

  @override
  void initState(){
    super.initState();

    // get initial list
    final db = DbController();
    assessmentList = db.getAllAssessForCourse(widget.course);
    
    // use a diff style of stream builder


    // // listen for changes to assessment list
    // DbController().dataBase.then((isar){
    //   Stream<void> assessmentChange = isar.assessments.watchLazy();
    //   assessmentChange.listen((event) {
    //     setState(() {
    //       assessmentList = db.getAllAssessForCourse(widget.course);
    //     });
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      // child: ListView.builder(
      //   itemCount: widget.assessList.length,
      //   shrinkWrap: true,
      //   itemBuilder:(context, index) {
      //     return ViewCoursePageAssessCard(assessment: widget.assessList[index]);
      //   },
      // ),

      child: FutureBuilder<List<Assessment>>(
        future: assessmentList,
        
        builder: (context, snapshot) {
          if(snapshot.hasData){

            // card for each assessment
            return ListView.builder(
              itemCount: snapshot.data?.length,
              shrinkWrap: true,
              itemBuilder:(context, index) {
                final assessment = snapshot.data?[index];
                if(assessment != null){
                  return ViewCoursePageAssessCard(assessment: assessment);
                } else {
                  return const Text('No assessment');
                }
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