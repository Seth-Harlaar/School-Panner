import 'package:flutter/material.dart';
import 'package:school_planner/form_handler.dart';

class NewCourseForm extends StatefulWidget {
  const NewCourseForm({super.key});

  @override
  State<NewCourseForm> createState() => _NewCoursetFormState();
}

class _NewCoursetFormState extends State<NewCourseForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final courseForm = FormHandler(formInput: {});

    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text('Course Title'),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Title',
            ),
            validator: FormHandler.validateTextInput,
            onSaved:(newValue){
              if(newValue != null ){
                courseForm.formInput['title'] = newValue;
              }
            },
          ),
          
          const SizedBox(height: 25),
          
          const Text('Course Code'),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Code',
            ),
          ),

          const SizedBox(height: 25),
          const Text('Hours Required per Week'),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Ex: 5',
            ),
          ),

          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: (){
              courseForm.submitCourse(formKey: _formKey);
            },
              child: const Text('Submit')
          ),
        ],
      )
    );
  }
}