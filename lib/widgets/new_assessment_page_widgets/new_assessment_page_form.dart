import 'package:flutter/material.dart';
import 'package:school_planner/form_handler.dart';
import 'package:school_planner/widgets/assets/assets.dart';
import 'package:school_planner/widgets/new_assessment_page_widgets/new_assessment_page_progress_selector.dart';
import 'package:school_planner/widgets/new_assessment_page_widgets/new_assessment_page_tabs.dart';
import 'package:school_planner/widgets/new_assessment_page_widgets/new_assessment_page_widgets.dart';

class NewAssessmentForm extends StatefulWidget {
  const NewAssessmentForm({super.key, required this.courseId});

  final int courseId;

  @override
  State<NewAssessmentForm> createState() => _NewAssessmentFormState();
}

class _NewAssessmentFormState extends State<NewAssessmentForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime? dueDate;

  @override
  Widget build(BuildContext context) {
    final courseForm = FormHandler(formInput: {});
    courseForm.formInput['date'] = null;

    return 
      NewAssessmentFormPages();
    }
}
