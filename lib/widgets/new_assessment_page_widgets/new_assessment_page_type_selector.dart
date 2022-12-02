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
  Widget _buttonListBuilder(BuildContext context, int buttonIndex){
    
    if(buttonIndex == selectedAssessType.index ){
      return _buttonBuilder(true, buttonIndex);
    } else {
      return _buttonBuilder(false, buttonIndex);
    }
  }

  // for building selected/unselected buttons
  Widget _buttonBuilder(bool highlight, int buttonIndex){
    return ElevatedButton(
      onPressed: (){
        if(!highlight){
          setState(() {
            selectedAssessType = AssessmentType.values[buttonIndex];
            widget.formHandler.formInput['type'] = selectedAssessType;
          });
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: highlight? const Color(0xFFC20430) : const Color(0xFF3D3D3D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7)
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child:  Text(
          AssessmentType.values[buttonIndex].name,
          style: const TextStyle( fontSize: 15 ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: _buttonListBuilder
      ),
    );
  }
}


