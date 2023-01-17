import 'package:flutter/material.dart';
import 'package:school_planner/state_controller.dart';


class NotesPageSorting extends StatelessWidget {
  
  const NotesPageSorting({super.key});

  @override
  Widget build(BuildContext context){
    // final AppState? appState = AppStateContainer.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,

        children: [
          const Text(
            'Sort by:',
            style: TextStyle(
              fontSize: 25,
            )
          ),
          const Text(
           'Note count: none'
          ),

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
                        'Size',
                        style: TextStyle( fontSize: 15 ),
                      ),
                  ),
                ),

                ElevatedButton(
                  onPressed: (){},
                  child: const Padding(
                    padding:  EdgeInsets.all(10.0),
                    child:  Text(
                        'Title',
                        style: TextStyle( fontSize: 15 ),
                      ),
                  ),
                ),
                
              ],
            ),
          ),
          
          
        ],
      )
    );
  }
}
