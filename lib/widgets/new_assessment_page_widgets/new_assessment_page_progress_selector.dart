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

  // for building selected/unselected buttons
  Widget _buttonBuilder(int buttonIndex){
    List<String> buttonTexts = ['Not Started', 'Working on', 'Almost done', 'Finished'];

    bool highlight = selectedStatus.index == buttonIndex;
    return TextButton(
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
        backgroundColor: highlight? const Color(0xFFC20430) : const Color(0xFF1F1F1F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7)
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child:  Text(
          buttonTexts[buttonIndex],
          style: TextStyle( 
            fontSize: 13,
            color: highlight? Colors.white : const Color(0xFFADADAD),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){

    return Column(
      children: [
        // top row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ 
            Expanded(child: _buttonBuilder(0)),
            const SizedBox(width: 15),
            Expanded(child: _buttonBuilder(1)),
          ],
        ),
        // bottom row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ 
            Expanded(child: _buttonBuilder(2)),
            const SizedBox(width: 15),
            Expanded(child: _buttonBuilder(3)),
          ],
        )
      ],
    );
  }
}



