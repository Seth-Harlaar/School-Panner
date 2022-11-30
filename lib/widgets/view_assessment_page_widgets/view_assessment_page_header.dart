import 'package:flutter/material.dart';
import 'package:school_planner/widgets/assets/assets.dart';



class ViewAssessmnetPageHeader extends StatelessWidget {
  const ViewAssessmnetPageHeader({super.key, required this.assessmentTitle, required this.assessmentDescription});

  final String assessmentTitle;
  final String assessmentDescription;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      
      child: LargePrimaryCard (
        

        child: Padding(
          padding: const EdgeInsets.all(10.0),

          child: Container(
            constraints: const BoxConstraints(minHeight: 150),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.min,

              children: [
          
                Expanded(
                  child: Column(
                    children: [
                      CustomHeader(
                        text: assessmentTitle,
                        size: 0
                      ),
                      CustomSubHeading(
                        text: assessmentDescription*10,
                        size: 2
                      )
                    ],
                  ),
                ),
              
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      const Text(
                        'Make a new one',
                        style: TextStyle( fontSize: 20 ),
                      ),
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



