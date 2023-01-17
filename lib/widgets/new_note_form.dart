import 'package:flutter/material.dart';
import 'package:school_planner/form_handler.dart';
import 'package:school_planner/models/student.dart';
import 'package:school_planner/state_controller.dart';
import 'package:school_planner/widgets/assets/assets.dart';
import 'package:school_planner/widgets/assets/custom_inputs.dart';

class NewNoteForm extends StatefulWidget {
  const NewNoteForm({super.key});

  @override
  State<NewNoteForm> createState() => _NewNoteFormState();
}

class _NewNoteFormState extends State<NewNoteForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final noteForm = FormHandler(formInput: {});

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const CustomHeader( size: 3, text: 'Note title:' ),
              const SizedBox(height: 5),
              TextFormField(
                decoration: customFieldDecoration('Things to do'),
                validator: FormHandler.validateTextInput,
                onSaved:(newValue){
                  if(newValue != null ){
                    noteForm.formInput['title'] = newValue;
                  }
                },
              ),
              const SizedBox(height: 25),
              
              
              const CustomHeader( size: 3, text: 'Note body:' ),
              const SizedBox(height: 5),
              TextFormField(
                maxLines: 10,
                maxLength: 1000,
                decoration: customFieldDecoration('- clean up my room\n- walk the dog'),
                validator: FormHandler.validateTextInput,
                onSaved: (newValue) {
                  if(newValue != null ){
                    noteForm.formInput['body'] = newValue;
                  }
                },
              ),
              const SizedBox(height: 25),
            ],
          ),
          
          ElevatedButton(
            onPressed: (){
              noteForm.submitNote(formKey: _formKey);

              // Navigator.of(context).pop(context);
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