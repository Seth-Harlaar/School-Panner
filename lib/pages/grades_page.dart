import 'package:flutter/material.dart';
import 'package:school_planner/widgets/app_bar.dart';
import 'package:school_planner/widgets/grades_page_widgets/grades_page_widgets.dart';
import 'package:school_planner/widgets/nav_bar.dart';



class GradesPage extends StatelessWidget {
  const GradesPage({super.key});

  // update appstate to reflect the fact that we are on the second page

  @override
  Widget build(BuildContext context){
    
    return Scaffold(
      // appBar: const PreferredSize(
      //   preferredSize: Size.fromHeight(50),
      //   child: AppToolBar(), 
      // ),

      body: Column(
        children: const [
          SizedBox(height: 25),
          Text(
            'Grades Page',
            style: TextStyle( fontSize: 20 )
          ),
          SizedBox(height: 25,),
          GradesPageHeader(),
          SizedBox(height: 25,),
          GradesPageSorting(),
          SizedBox(height: 10,),
          Expanded(
            child: GradesPageClassList()
          ),
          
        ],
      ),

      bottomNavigationBar: const NaVBar(),
    );
  }
}
