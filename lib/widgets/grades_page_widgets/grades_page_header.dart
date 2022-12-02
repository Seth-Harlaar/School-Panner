import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:school_planner/database_controller.dart';
import 'package:school_planner/pages/new_course_page.dart';
import 'package:school_planner/widgets/assets/assets.dart';


class GradesPageHeader extends StatefulWidget {
  const GradesPageHeader({super.key});

  @override
  State<GradesPageHeader> createState() => _GradesPageHeaderState();
}

class _GradesPageHeaderState extends State<GradesPageHeader> {

  late Future<int> courseCount;

  @override
  void initState(){
    super.initState();

    // get db and # of courses
    final db = DbController();
    courseCount = db.getCourseCount();
  }

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      
      child: LargeSecondaryCard (
        

        child: Padding(
          padding: const EdgeInsets.all(10.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [

              FutureBuilder<int>(                
                future: courseCount,
                builder: (context, snapshot){
                  
                  if(snapshot.hasData){
                    return CustomHeader(
                      size: 1,
                      text: 'You have ${snapshot.data} courses with an average of x%',
                    );

                  } else {
                    return const CustomHeader(
                      size: 1,
                      text: 'You have x courses with an average of x%',
                    );
                  }
                },
              ),

              
              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  const Text(
                    'Make a new one',
                    style: TextStyle( fontSize: 20 ),
                  ),

                  const Spacer(),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NewCoursePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC72A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)
                      )
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.all(10.0),
                      child:  Text(
                        'New',
                        style: TextStyle( fontSize: 20 ),
                      ),
                    ),
                  )
                ],
              )  
              
            ]
          ),
        ),
      ),
    );
  }
}
