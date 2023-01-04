import 'package:flutter/material.dart';



class GradesPageSorting extends StatelessWidget {
  const GradesPageSorting({super.key});

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,

        children: [
          const Text(
            'Sort by:',
            style: TextStyle(
              fontSize: 15,
            )
          ),

          const SizedBox(height:5),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                ElevatedButton(
                  onPressed: (){},
                  child: const Padding(
                    padding:  EdgeInsets.all(10.0),
                    child:  Text(
                        'Created',
                        style: TextStyle( fontSize: 15 ),
                      ),
                  ),
                ),

                ElevatedButton(
                  onPressed: (){},
                  child: const Padding(
                    padding:  EdgeInsets.all(10.0),
                    child:  Text(
                        'Things',
                        style: TextStyle( fontSize: 15 ),
                      ),
                  ),
                ),

                ElevatedButton(
                  onPressed: (){},
                  child: const Padding(
                    padding:  EdgeInsets.all(10.0),
                    child:  Text(
                        'Grade',
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
