import 'package:flutter/material.dart';
import 'package:school_planner/pages/new_course_page.dart';
import 'package:school_planner/widgets/assets/assets.dart';


class GradesPageHeader extends StatelessWidget {
  const GradesPageHeader({super.key});

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

              const Text(
                'You have x courses with an average of 69.5%',
                style: TextStyle( fontSize: 20 )
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
