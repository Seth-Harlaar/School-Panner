import 'package:flutter/material.dart';
import 'package:school_planner/widgets/assets/assets.dart';

List<Widget> infoCards(Map<String, dynamic> data){

  // defines list of internals functionality and layout for cards
  List<Widget> infoCardsInternalsList = [
    
    // urgency card
    GestureDetector(
      onTap: () {
        // open a dialogue box
        print("clicked 1");
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomHeader(
              text: 'Urgency',
              size: 1,
            ),
            CustomSubHeading(
              text: '${data['urg']}',
              size: 3,
            )

          ],
        )
      ),
    ),

    // importance card
    GestureDetector(
      onTap: () {
        // open a dialogue box
        print("clicked 2");
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomHeader(
              text: 'Importance',
              size: 1,
            ),
            CustomSubHeading(
              text: '${data['imp']}',
              size: 3,
            )

          ],
        )
      ),
    ),

    // due date card
    GestureDetector(
      onTap: () {
        // open a dialogue box
        print("clicked 3");
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomHeader(
              text: 'Due Date',
              size: 1,
            ),
            CustomSubHeading(
              text: '${data['dueDate']}',
              size: 3,
            )

          ],
        )
      ),
    ),

    // ungraded card
    GestureDetector(
      onTap: () {
        // open a dialogue box
        print("clicked 4");
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomHeader(
              text: data['ungraded'] ? 'Ungraded':'Graded',
              size: 1,
            ),
            CustomSubHeading(
              text: data['ungraded'] ? 'submit grade':'view grade',
              size: 3,
            )

          ],
        )
      ),
    ),
  ];

  // put each internal into cards
   final widgetsList = List<Widget>.generate(
    4,
    (i){
      return _cardBuilder(i, infoCardsInternalsList[i]);
    }
  );

  return widgetsList;
}

Widget _cardBuilder(int cardIndex, Widget childWidget){
    
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: (cardIndex == 0 || cardIndex == 3) ? const Color(0xFF3D3D3D) : const Color(0xFFC20430),  
      child: childWidget,
    );
  }

// {'urg': 0, 'imp': 0, 'dueDate': 'none yet', 'ungraded': true}