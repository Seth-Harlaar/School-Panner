import 'package:flutter/material.dart';
import 'package:school_planner/form_handler.dart';
import 'package:school_planner/models/course.dart';
import 'package:school_planner/widgets/assets/assets.dart';

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

              const CustomHeader( size: 3, text: 'Course Title' ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Title',
                  hintStyle: TextStyle(color: Color(0x99FFFFFF)),
                  enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white)),
                ),
                validator: FormHandler.validateTextInput,
                onSaved:(newValue){
                  if(newValue != null ){
                    courseForm.formInput['title'] = newValue;
                  }
                },
              ),
              const SizedBox(height: 25),
              
              
              const CustomHeader( size: 3, text: 'Course Code' ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Code',
                  hintStyle: TextStyle(color: Color(0x99FFFFFF)),
                  enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white)),
                ),
                validator: FormHandler.validateTextInput,
                onSaved: (newValue) {
                  if(newValue != null ){
                    courseForm.formInput['code'] = newValue;
                  }
                },
              ),
              const SizedBox(height: 25),


              const CustomHeader( size: 3, text: 'Hours Required per Week' ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Ex: 5',
                  hintStyle: TextStyle(color: Color(0x99FFFFFF)),
                  enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white)),
                ),
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