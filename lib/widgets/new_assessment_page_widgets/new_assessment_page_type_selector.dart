import 'package:flutter/material.dart';
import 'package:school_planner/form_handler.dart';
import 'package:school_planner/models/assessment.dart';



class NewAssessmentPageTypeSelector extends StatefulWidget {
  const NewAssessmentPageTypeSelector({super.key, required this.formHandler});

  final FormHandler formHandler;

  @override
  State<NewAssessmentPageTypeSelector> createState() => _NewAssessmentPageTypeSelectorState();
}

class _NewAssessmentPageTypeSelectorState extends State<NewAssessmentPageTypeSelector> {
  
  AssessmentType selectedAssessType = AssessmentType.assignment;

  @override
  void initState(){
    super.initState();
    widget.formHandler.formInput['type'] = selectedAssessType;
  }

  // for building the list of buttons
  List<Widget> _buttonListBuilder(){
    // if(buttonIndex == selectedAssessType.index ){
    //   return _buttonBuilder(true, buttonIndex);
    // } else {
    //   return _buttonBuilder(false, buttonIndex);
    // }

    List<Widget> buttonList = [];

    for(var i = 0; i < 3; i++){
      buttonList.add(_buttonBuilder(i == selectedAssessType.index? true : false, i));
      if( i != 2){
        buttonList.add(const SizedBox(width: 10,));
      }
    }
    return buttonList;
  }

  // for building selected/unselected buttons
  Widget _buttonBuilder(bool highlight, int buttonIndex){
    return Expanded(
      child: TextButton(
        onPressed: (){
          if(!highlight){
            setState(() {
              selectedAssessType = AssessmentType.values[buttonIndex];
              widget.formHandler.formInput['type'] = selectedAssessType;
            });
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: highlight? const Color(0xFFC20430) : const Color(0xFF1F1F1F),
        ),
        child: Text(
          AssessmentType.values[buttonIndex].name,
          style: TextStyle( 
            fontSize: 13,
            color: highlight? Colors.white : const Color(0xFFADADAD),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: _buttonListBuilder(),
      )
    );
  }
}


