import 'package:flutter/material.dart';
import 'package:school_planner/form_handler.dart';
import 'package:school_planner/models/assessment.dart';
import 'package:school_planner/widgets/assets/assets.dart';

List<Widget> infoCards(Assessment assessment, context){


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
              text: '${assessment.urgency}',
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
              text: '${assessment.importance}',
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
              text: assessment.dueDate == null ?
                'None selected':
                '${assessment.dueDate}'
                ,
              size: 3,
            )

          ],
        )
      ),
    ),

    // ungraded card
    GestureDetector(
      onTap: () {
        // open submit grade box
        showDialog(
          context: context,
          builder: (_) => _gradeDialog(assessment),
          barrierDismissible: true,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomHeader(
              text: (assessment.graded) ? 'Graded':'Ungraded',
              size: 1,
            ),
            CustomSubHeading(
              text: (assessment.graded) ? 
                'Final Grade: ${assessment.finalGrade}%' :
                'submit grade',
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

// for individual cards
Widget _cardBuilder(int cardIndex, Widget childWidget){
  
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    color: (cardIndex == 0 || cardIndex == 3) ? const Color(0xFF3D3D3D) : const Color(0xFFC20430),
    child: childWidget,
  );
}


Widget _gradeDialog(Assessment assessment){
  final FormHandler ungradedForm = FormHandler(formInput: {});

  void buttonCallback(){
    ungradedForm.updateAssessmentGrade(id: assessment.id);
  }

  return AlertDialog(
    backgroundColor: const Color(0xFF3D3D3D),
    elevation: 24,
    
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeader(
          size: 2,
          text: (assessment.graded) ?
            // make a rich text to highlight the grade
            'You achieved a final grade of ${assessment.finalGrade}% on this assessment.' :
            'You have not yet completed this assignment.'
        ),
        CustomSubHeading(
          size: 3,
          text: (assessment.graded) ?
            'You can change your grade here:' :
            'You can input your grade here:'
        ),
      ],
    ),

    content: Form(
      autovalidateMode: AutovalidateMode.always,
      onChanged: () {
        Form.of(primaryFocus!.context!)!.save();
      },
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: '89.5..',
          hintStyle: TextStyle(color: Color(0x99FFFFFF)),
          enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white)),
        ),
        validator: FormHandler.validateDoubleInput,
        onSaved:(newValue){
          if(newValue != null ){
            ungradedForm.formInput['grade'] = newValue;
          }
        },
      )
    ),

    actions: [
      TextButton(
        onPressed: buttonCallback,
        child: const HighlightText(text: 'Submit', size: 3),
      )
    ]
  );
}