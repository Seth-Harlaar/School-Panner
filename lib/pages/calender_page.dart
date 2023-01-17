import 'package:flutter/material.dart';
import 'package:school_planner/widgets/app_bar.dart';
import 'package:school_planner/widgets/calender_page_widgets/calender_page_widgets.dart';


class CalenderPage extends StatelessWidget {
  const CalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppToolBar(),
      ),

      backgroundColor: Color(0xFF3D3D3D),

      body: Column(
        children: [
          Container(

            decoration: const BoxDecoration(
              color: Color(0xFF1F1F1F),
              borderRadius: BorderRadius.only(  
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
              )
            ),

            child: Column(
              children: const [
                SizedBox(height: 15),
                // CalenderPageCalenderList(),
                SizedBox(height: 15),
                CalenderPageCalenderView(),
                SizedBox(height: 15,),
              ],
            )
          ),

          Expanded(
            child: Container(
              child: Column(
                children: const [
                  SizedBox(height: 25,),
                  // CalenderPageEventList(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}