import 'package:flutter/material.dart';
import 'package:school_planner/form_handler.dart';
import 'package:school_planner/models/course.dart';
import 'package:school_planner/widgets/assets/assets.dart';
import 'package:school_planner/widgets/assets/custom_inputs.dart';

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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const CustomHeader( size: 3, text: 'Course title:' ),
              const SizedBox(height: 5),
              TextFormField(
                decoration: customFieldDecoration('Introduction to Computer Science'),
                validator: FormHandler.validateTextInput,
                onSaved:(newValue){
                  if(newValue != null ){
                    courseForm.formInput['title'] = newValue;
                  }
                },
              ),
              const SizedBox(height: 25),
              
              
              const CustomHeader( size: 3, text: 'Course code:' ),
              const SizedBox(height: 5),
              TextFormField(
                decoration: customFieldDecoration('CS50'),
                validator: FormHandler.validateTextInput,
                onSaved: (newValue) {
                  if(newValue != null ){
                    courseForm.formInput['code'] = newValue;
                  }
                },
              ),
              const SizedBox(height: 25),


              const CustomHeader( size: 3, text: 'Hours required per week:' ),
              const SizedBox(height: 5),
              TextFormField(
                decoration: customFieldDecoration('12'),
                validator: FormHandler.validateIntegerInput,
                onSaved: (newValue) {
                  if(newValue != null ){
                    courseForm.formInput['hours'] = newValue;
                  }
                },
              ),
              const SizedBox(height: 25),
            
            
            ],
          ),

          ElevatedButton(
            onPressed: (){
              courseForm.submitCourse(formKey: _formKey);

              Navigator.of(context).pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFC72A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7)
              )
            ),
            child: const Text('Submit')
          ),
        ],
      )
    );
  }
}