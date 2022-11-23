import 'package:flutter/material.dart';


class CalenderPageCalenderList extends StatelessWidget {
  const CalenderPageCalenderList({super.key});

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,

        children: [
          const SizedBox(height:15),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal:15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                ElevatedButton(
                  onPressed: (){},
                  child: const Padding(
                    padding:  EdgeInsets.all(10.0),
                    child:  Text(
                        'Assigns',
                        style: TextStyle( fontSize: 15 ),
                      ),
                  ),
                ),

                ElevatedButton(
                  onPressed: (){},
                  child: const Padding(
                    padding:  EdgeInsets.all(10.0),
                    child:  Text(
                        'B-Days',
                        style: TextStyle( fontSize: 15 ),
                      ),
                  ),
                ),

                ElevatedButton(
                  onPressed: (){},
                  child: const Padding(
                    padding:  EdgeInsets.all(10.0),
                    child:  Text(
                        'Work',
                        style: TextStyle( fontSize: 15 ),
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
