import 'package:flutter/material.dart';
import 'package:school_planner/models/assessment.dart';
import 'package:school_planner/widgets/assets/assets.dart';



class ViewAssessmnetPageHeader extends StatelessWidget {
  const ViewAssessmnetPageHeader({super.key, required this.assessmentTitle, required this.assessmentDescription, required this.assessmentType});

  final String assessmentTitle;
  final String assessmentDescription;
  final AssessmentType assessmentType;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      
      child: LargePrimaryCard (
        

        child: Padding(
          padding: const EdgeInsets.all(10.0),

          child: Container(
            constraints: const BoxConstraints(maxHeight: 150),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
          
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomHeader(
                          text: assessmentTitle,
                          size: 0
                        ),
                        CustomSubHeading(
                          text: assessmentDescription,
                          size: 2
                        )
                      ],
                    ),
                ),
              
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        
                        assessmentIcon(assessmentType),
                        ElevatedButton(
                          onPressed: (){
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     // builder: (context) => const NewCoursePage(),
                            //   ),
                            // );
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
                              'Edit',
                              style: TextStyle( fontSize: 20 ),
                            ),
                          ),
                        ),
                            
                      ],
                    ),
                ),
              
              ]
            ),
          ),
        ),
      ),
    );
  }
}



