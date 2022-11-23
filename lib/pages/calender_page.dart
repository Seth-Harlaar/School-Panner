import 'package:flutter/material.dart';
import 'package:school_planner/widgets/app_bar.dart';
import 'package:school_planner/widgets/calender_page_widgets/calender_page_widgets.dart';


class CalenderPage extends StatelessWidget {
  const CalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppToolBar(),
      ),

      body: Column(
        children: [
          Container(

            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(  
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
              )
            ),

            child: Column(
              children: const [
                SizedBox(height: 25,),
                CalenderPageCalenderList(),
                SizedBox(height: 25,),
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
                  CalenderPageEventList(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}