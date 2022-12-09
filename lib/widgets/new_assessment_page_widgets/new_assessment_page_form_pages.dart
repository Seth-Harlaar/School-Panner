import 'package:flutter/material.dart';
import 'package:school_planner/form_handler.dart';
import 'package:school_planner/models/assessment.dart';
import 'package:school_planner/widgets/assets/assets.dart';
import 'package:school_planner/widgets/assets/custom_inputs.dart';
import 'package:school_planner/widgets/new_assessment_page_widgets/new_assessment_page_widgets.dart';


// add persistance of form informatin of page change

class NewAssessmentFormPages extends StatefulWidget {
  const NewAssessmentFormPages({super.key, required this.courseId});

  final int courseId;

  @override
  State<NewAssessmentFormPages> createState() => _NewAssessmentFormPagesState();
}

class _NewAssessmentFormPagesState extends State<NewAssessmentFormPages> {
  int selectedPage = 0;
  PageController pageController = PageController();
  DateTime? dueDate;
  FormHandler newAssessmentFormHandler = FormHandler(formInput: {});

  @override
  void initState(){
    super.initState();
    newAssessmentFormHandler.formInput['date'] = null;
    newAssessmentFormHandler.formInput['type'] = AssessmentType.assignment;
    newAssessmentFormHandler.formInput['status'] = AssessmentStatus.notStarted;
  }
  
  void _updateSelectedPage(int index){
    setState(() {
      selectedPage = index;
    });
    pageController.animateToPage(
      selectedPage, 
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _updateDueDate(DateTime? inputDueDate){
    if(inputDueDate != null){
      setState(() {
        dueDate = inputDueDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // tabs above forms - remove clickability
        NewAssessmentPageTabs(selectedTab: selectedPage, updateTabSelection: _updateSelectedPage),
        
        // form pages
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF3D3D3D),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(7), bottomLeft: Radius.circular(7)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(0),

              child: PageView(
                controller: pageController,
                onPageChanged: (pageIndex){
                  setState(() {
                    selectedPage = pageIndex;
                  });
                },
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: FormDescriptionPage(formHandler: newAssessmentFormHandler, updatePage: _updateSelectedPage),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: FormDetailsPage(formHandler: newAssessmentFormHandler, updatePage: _updateSelectedPage),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: FormDueDatePage(formHandler: newAssessmentFormHandler, dueDateCallback: _updateDueDate, dueDate: dueDate, courseId: widget.courseId),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}




// first page
class FormDescriptionPage extends StatefulWidget {
  const FormDescriptionPage({super.key, required this.formHandler, required this.updatePage});

  final FormHandler formHandler;
  final void Function(int) updatePage;


  @override
  State<FormDescriptionPage> createState() => _FormDescriptionPageState();
}

class _FormDescriptionPageState extends State<FormDescriptionPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // title field
                const SizedBox(height: 10),
                const CustomHeader(
                  size: 3,
                  text: 'Title:'
                ),
                const SizedBox(height: 5),
                TextFormField(
                  decoration: customFieldDecoration('Assignment 3'),
                  validator: FormHandler.validateTextInput,
                  onSaved:(newValue){
                    if(newValue != null ){
                      widget.formHandler.formInput['title'] = newValue;
                      // widget.submitFormInput('title', newValue);
                    }
                  },
                ),
                const SizedBox(height: 25),
          
                // description field
                const CustomHeader(
                  size: 3,
                  text: 'Description:'
                ),
                const SizedBox(height: 5),
                TextFormField(
                  maxLines: 3,
                  decoration: customFieldDecoration('A 1500 word essay about the...'),
                  validator: FormHandler.validateTextInput,
                  onSaved:(newValue){
                    if(newValue != null ){
                      widget.formHandler.formInput['description'] = newValue;
                      // widget.submitFormInput('description', newValue);
                    }
                  },
                ),
                const SizedBox(height: 25),
          
                // type field
                Center(
                  child: NewAssessmentPageTypeSelector(formHandler: widget.formHandler),
                ),
          
              ],
            ),
          ),

          // next page 
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFC72A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)
              )
            ),
            onPressed: (){
              // navigate to next page after saving
              if(_formKey.currentState!.validate()){
                _formKey.currentState!.save();
                widget.updatePage(1);
              }
            },
            child: const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5),
              child:  Text(
                'Next',
                style: TextStyle( fontSize: 15 ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





// second page
class FormDetailsPage extends StatefulWidget {
  const FormDetailsPage({super.key, required this.formHandler, required this.updatePage});
  
  final FormHandler formHandler;
  final void Function(int) updatePage;

  @override
  State<FormDetailsPage> createState() => _FormDetailsPageState();
}

class _FormDetailsPageState extends State<FormDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  bool isFinished = false;
  final finalGradeController = TextEditingController();

  void _updateVisibility(bool visible){
    setState(() {
      isFinished = visible;
    });
    finalGradeController.clear();
    widget.formHandler.formInput['finalGrade'] = null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // title field
                const SizedBox(height: 10),
                const Text('Weight (%):'),
                const SizedBox(height: 5),
                TextFormField(
                  decoration: customFieldDecoration('40'),
                  validator: FormHandler.validateDoubleInput,
                  onSaved:(newValue){
                    if(newValue != null ){
                      widget.formHandler.formInput['weight'] = newValue;
                      // widget.submitFormInput('weight', newValue);
                    }
                  },
                ),
                const SizedBox(height: 25),
          
                // progress field
                const Text('Progress:'),
                const SizedBox(height: 5),
                Center(
                  child: NewAssessmentPageProgressSelector(formHandler: widget.formHandler, updateVisibilityFunction: _updateVisibility),
                ),
                const SizedBox(height: 25),

                // final grade field
                Text(
                  'Final grade (%):',
                  style: TextStyle(
                    color: isFinished? Colors.white : const Color(0xFF4C4C4C) ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  enabled: isFinished,
                  decoration: customFieldDecoration( isFinished ? '89.5' : '--' ),
                  controller: finalGradeController,                  
                  validator: FormHandler.validateDoubleInput,
                  onSaved:(newValue){
                    if(newValue != null ){
                      widget.formHandler.formInput['finalGrade'] = newValue;
                      // widget.submitFormInput('finalGrade', newValue);
                    }
                  },
                ),
                const SizedBox(height: 25),

              ],
            ),
          ),

          // next page 
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFC72A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)
              )
            ),
            onPressed: (){
              // navigate to next page after saving
              if(_formKey.currentState!.validate()){
                _formKey.currentState!.save();
                widget.updatePage(2); 
              }
            },
            child: const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5),
              child:  Text(
                'Next',
                style: TextStyle( fontSize: 15 ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




// third page
class FormDueDatePage extends StatefulWidget {
  const FormDueDatePage({super.key, required this.formHandler, required this.dueDateCallback, this.dueDate, required this.courseId});

  final int courseId;
  final FormHandler formHandler;
  final void Function(DateTime?) dueDateCallback;
  final DateTime? dueDate;

  @override
  State<FormDueDatePage> createState() => _FormDueDatePageState();
}

class _FormDueDatePageState extends State<FormDueDatePage> {
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          
          // form inputs
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 25),
                ElevatedButton(
                  // get a due date from the user
                  onPressed: (){
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 200)),
                    ).then((dateTime){
                      widget.formHandler.formInput['date'] = dateTime;
                      widget.dueDateCallback(dateTime);
                    });
                  },
                  child: const Text('Pick a date'),
                ),
                
                CustomHeader(
                  text: (widget.dueDate == null) ?
                    'No date picked yet' :
                    'Selected due date: ${widget.dueDate}',
                  size: 3
                ),
              ],
            ),
          ),

          // submit button
          ElevatedButton(
            onPressed: (){
              // navigate to next page after saving
              if(_formKey.currentState!.validate()){
                _formKey.currentState!.save();
                print('Submitted last page');
                print(widget.formHandler.formInput);
                widget.formHandler.submitAssessment2(courseId: widget.courseId);
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}