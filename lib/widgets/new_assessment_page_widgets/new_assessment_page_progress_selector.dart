import 'package:flutter/material.dart';
import 'package:school_planner/form_handler.dart';
import 'package:school_planner/models/assessment.dart';



class NewAssessmentPageProgressSelector extends StatefulWidget {
  const NewAssessmentPageProgressSelector({super.key, required this.formHandler, required this.updateVisibilityFunction});

  final FormHandler formHandler;
  final void Function(bool) updateVisibilityFunction;

  @override
  State<NewAssessmentPageProgressSelector> createState() => _NewAssessmentPageProgressSelectorState();
}

class _NewAssessmentPageProgressSelectorState extends State<NewAssessmentPageProgressSelector> {
  
  AssessmentStatus selectedStatus = AssessmentStatus.notStarted;

  @override
  void initState(){
    super.initState();
    widget.formHandler.formInput['status'] = selectedStatus;
  }

  // for building the list of buttons
  Widget _buttonListBuilder(int buttonIndex){
    
    if(buttonIndex == selectedStatus.index ){
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
            selectedStatus = AssessmentStatus.values[buttonIndex];
            widget.formHandler.formInput['status'] = selectedStatus;
            
            // update final grade visibility field
            AssessmentStatus.values[buttonIndex] == AssessmentStatus.finished ? 
              widget.updateVisibilityFunction(true) :
              widget.updateVisibilityFunction(false);
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
          AssessmentStatus.values[buttonIndex].name,
          style: const TextStyle( fontSize: 15 ),
        ),
      ),
    );
  }


  List<Widget> _buttonListContainer(){

    final buttonList = List<Widget>.generate(
      4,
      (i){
        return _buttonListBuilder(i);
      }
    );
    return buttonList;
  } 
  
  @override
  Widget build(BuildContext context){

    return Wrap(
      alignment: WrapAlignment.spaceAround,
      children: _buttonListContainer(),
    );
  }
}



