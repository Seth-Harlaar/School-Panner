import 'package:flutter/material.dart';
import 'package:school_planner/models/assessment.dart';
import 'package:school_planner/widgets/app_bar.dart';
import 'package:school_planner/widgets/view_assessment_page_widgets/view_assessment_page_widgets.dart';


class ViewAssessmentPage extends StatelessWidget {
  const ViewAssessmentPage({super.key, required this.pageAssess});

  final Assessment pageAssess;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppToolBar(), 
      ),
      body: Column(
        children: [
          ViewAssessmnetPageHeader(assessmentTitle: pageAssess.title, assessmentDescription: pageAssess.description),
        ],
      )
    );
  }
}