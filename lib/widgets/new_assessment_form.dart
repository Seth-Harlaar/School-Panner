import 'package:flutter/material.dart';
import 'package:school_planner/form_handler.dart';

class NewAssessmentForm extends StatefulWidget {
  const NewAssessmentForm({super.key, required this.courseId});

  final int courseId;

  @override
  State<NewAssessmentForm> createState() => _NewAssessmentFormState();
}

class _NewAssessmentFormState extends State<NewAssessmentForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final courseForm = FormHandler(formInput: {});

    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text('Title'),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Assignment 3',
            ),
            validator: FormHandler.validateTextInput,
            onSaved:(newValue){
              if(newValue != null ){
                courseForm.formInput['title'] = newValue;
              }
            },
          ),
          
          const SizedBox(height: 25),
          
          const Text('Description'),
          TextFormField(
            decoration: const InputDecoration(
              hintText: '10 page essay...',
            ),
            validator: FormHandler.validateTextInput,
            onSaved:(newValue){
              if(newValue != null ){
                courseForm.formInput['description'] = newValue;
              }
            },
          ),

          const SizedBox(height: 25),
          const Text('Weight (%)'),
          TextFormField(
            decoration: const InputDecoration(
              hintText: '40',
            ),
            validator: FormHandler.validateIntegerInput,
            onSaved:(newValue){
              if(newValue != null ){
                courseForm.formInput['weight'] = newValue;
              }
            },
          ),

          const SizedBox(height: 25),
          const Text('Type'),
          TextFormField(
            decoration: const InputDecoration(
              hintText: '1,2,3',
            ),
            validator: FormHandler.validateIntegerInput,
            onSaved:(newValue){
              if(newValue != null ){
                courseForm.formInput['type'] = newValue;
              }
            },
          ),

          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: (){
              courseForm.submitAssessment(formKey: _formKey, courseId: widget.courseId);
            },
              child: const Text('Submit')
          ),
        ],
      )
    );
  }
}