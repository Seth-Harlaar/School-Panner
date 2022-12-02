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
          children: const [
            CustomHeader(
              text: 'Urgency',
              size: 1,
            ),
            CustomSubHeading(
              text: '0',
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
          children: const [
            CustomHeader(
              text: 'Importance',
              size: 1,
            ),
            CustomSubHeading(
              text: '0',
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
          children: const [
            CustomHeader(
              text: 'Due Date',
              size: 1,
            ),
            CustomSubHeading(
              text: 'never',
              size: 3,
            )

          ],
        )
      ),
    ),

    // ungraded card
    GestureDetector(
      onTap: () {
        print("clicked 4");

        // open submit grade box
        if(assessment.assessmentStatus.index != 3){
          showDialog(
            context: context,
            builder: (_) => _ungradedDialog(assessment.id),
            barrierDismissible: true,
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomHeader(
              text: (assessment.assessmentStatus.index != 3) ? 'Ungraded':'Graded',
              size: 1,
            ),
            CustomSubHeading(
              text: (assessment.assessmentStatus.index != 3) ? 'submit grade':'view grade',
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


// dialog box for updating grade
Widget _ungradedDialog(int assessmentId){

  final FormHandler ungradedForm = FormHandler(formInput: {});

  void buttonCallback(){
    ungradedForm.updateAssessmentGrade(id: assessmentId);
  }

  return AlertDialog(
    backgroundColor: const Color(0xFF3D3D3D),
    elevation: 24,

    title: const CustomHeader(
      size: 2,
      text: 'This assessment is currently ungraded, you can add a grade below:'
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
