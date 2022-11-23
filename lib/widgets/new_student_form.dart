import 'package:flutter/material.dart';
import 'package:school_planner/form_handler.dart';
import 'package:school_planner/models/student.dart';
import 'package:school_planner/state_controller.dart';

class NewStudentForm extends StatefulWidget {
  const NewStudentForm({super.key});

  @override
  State<NewStudentForm> createState() => _NewStudentFormState();
}

class _NewStudentFormState extends State<NewStudentForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // get the app state
    final AppState? appState = AppStateContainer.of(context);
    // get the student from the app state
    final Student? student = appState?.student;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              icon: const Icon(Icons.mail),
              hintText: '${student?.name}'
            ),
            validator: FormHandler.validateTextInput,
            onSaved:(newValue){
              if(newValue != null ){
                appState?.updateStudentName(newValue);
              }
            },
          ),

          ElevatedButton(
            onPressed: () {
              Student.newStudent(formKey: _formKey);
            },
            child: const Text('Submit')
          ),
        ],
      )
    );
  }
}