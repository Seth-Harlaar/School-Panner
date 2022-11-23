import 'package:flutter/material.dart';


class CalenderPageEventList extends StatelessWidget {
  const CalenderPageEventList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),

      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text('Thurs'),
              Card( child:Padding(
                padding: EdgeInsets.all(5.0),
                child: Text('15'),
              ), ),
              
            ],
          ),
          Expanded(
            child: Column(
          
              children: const [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                     child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text('hi'),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text('hi')
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text('hi')
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}