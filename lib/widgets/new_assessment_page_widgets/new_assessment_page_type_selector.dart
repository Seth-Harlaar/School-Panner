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

  Widget _buttonListBuilder(BuildContext context, int index){
    
    if(index == selectedAssessType.index ){
      return _buttonBuilder(true, index);
    } else {
      return _buttonBuilder(false, index);
    }
  }

  Widget _buttonBuilder(bool highlight, int index){

    // a selected button
    if(highlight){
      return ElevatedButton(
        onPressed: (){
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFC20430),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7)
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child:  Text(
            AssessmentType.values[index].name,
            style: const TextStyle( fontSize: 15 ),
          ),
        ),
      );
    
    // an unselected button
    } else {
      return ElevatedButton(
        onPressed: (){
          setState(() {
            selectedAssessType = AssessmentType.values[index];
            widget.formHandler.formInput['type'] = selectedAssessType;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3D3D3D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7)
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child:  Text(
            AssessmentType.values[index].name,
            style: const TextStyle( fontSize: 15 ),
          ),
        ),
      );
    }

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



