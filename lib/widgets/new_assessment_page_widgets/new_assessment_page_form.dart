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
  
    // return Form(
    //   key: _formKey,
    //   child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       children: [

    //         const Text('Title'),
    //         TextFormField(
    //           decoration: const InputDecoration(
    //             hintText: 'Assignment 3',
    //             hintStyle: TextStyle(color: Color(0x99FFFFFF)),
    //             enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white)),
    //           ),
    //           validator: FormHandler.validateTextInput,
    //           onSaved:(newValue){
    //             if(newValue != null ){
    //               courseForm.formInput['title'] = newValue;
    //             }
    //           },
    //         ),
    //         const SizedBox(height: 25),
            
            
    //         const Text('Description'),
    //         TextFormField(
    //           decoration: const InputDecoration(
    //             hintText: '10 page essay...',
    //             hintStyle: TextStyle(color: Color(0x99FFFFFF)),
    //             enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white)),
    //           ),
    //           validator: FormHandler.validateTextInput,
    //           onSaved:(newValue){
    //             if(newValue != null ){
    //               courseForm.formInput['description'] = newValue;
    //             }
    //           },
    //         ),
    //         const SizedBox(height: 25),


    //         const Text('Weight (%)'),
    //         TextFormField(
    //           decoration: const InputDecoration(
    //             hintText: '40',
    //             hintStyle: TextStyle(color: Color(0x99FFFFFF)),
    //             enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white)),
    //           ),
    //           validator: FormHandler.validateIntegerInput,
    //           onSaved:(newValue){
    //             if(newValue != null ){
    //               courseForm.formInput['weight'] = newValue;
    //             }
    //           },
    //         ),
      
      
    //         const SizedBox(height: 25),
    //         const Text('Type'),
    //         Center(child: NewAssessmentPageTypeSelector(formHandler: courseForm)),

    //           const SizedBox(height: 25),
    //         const Text('Status'),
    //         NewAssessmentPageProgressSelector(formHandler: courseForm),
      
    //         const SizedBox(height: 25),
    //         ElevatedButton(
    //           // get a due date from the user
    //           onPressed: (){
    //             showDatePicker(
    //               context: context,
    //               initialDate: DateTime.now(),
    //               firstDate: DateTime.now(),
    //               lastDate: DateTime.now().add(const Duration(days: 200)),
                
    //             ).then((dateTime){
    //               courseForm.formInput['date'] = dateTime;
    //             });
    //           },
    //           child: const Text('Pick a date and time'),
    //         ),
            
    //         CustomHeader(
    //           text: (dueDate == null) ?
    //             'No date picked yet' :
    //             'Selected due date: $dueDate',
    //           size: 3
    //         ),
          
    //         const SizedBox(height: 25),
    //         ElevatedButton(
    //           onPressed: (){
    //             print('submitting');
    //             print(courseForm.formInput['status']);
    //             print(courseForm.formInput['type']);
    //             print(courseForm.formInput['date']);
    //             courseForm.submitAssessment(formKey: _formKey, courseId: widget.courseId);
      
    //             Navigator.of(context).pop(context);
    //           },
    //           child: const Text('Submit'),
    //         ),
    //       ],
    //     ),
    // );

    return Column(
      children: const [
        NewAssessmentFormPages(),
      ]
    );
  }
}
