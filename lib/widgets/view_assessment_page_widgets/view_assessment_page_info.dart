import 'package:flutter/material.dart';
import 'package:school_planner/models/assessment.dart';
import 'package:school_planner/widgets/view_assessment_page_widgets/view_assessment_page_widgets.dart';



// future implementation:
// - when a user clicks on one of the info boxes open up a dialogue that displays more info
// - should also include the ability to edit the information

class ViewAssessmentPageInfo extends StatelessWidget {
  const ViewAssessmentPageInfo({super.key, required this.assessment});

  final Assessment assessment;

  Widget _cardBuilder(int cardIndex){
    
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: (cardIndex == 0 || cardIndex == 3) ? const Color(0xFF3D3D3D) : const Color(0xFFC20430),  
      // child: infoCardsInternals[cardIndex],
    );
  }

  // generate the list of cards
  List<Widget> _cardListBuilder(){
    
    final widgets = List<Widget>.generate(
      4,
      (i){
        return _cardBuilder(i);
      }
    );
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
    
        child: GridView.count(
          childAspectRatio: 2,
          crossAxisCount: 2,

        
          children: infoCards(assessment, context),
        ),
    
      ),
    );
  }
}