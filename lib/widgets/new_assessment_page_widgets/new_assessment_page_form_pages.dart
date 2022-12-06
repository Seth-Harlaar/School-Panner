import 'package:flutter/material.dart';
import 'package:school_planner/form_handler.dart';
import 'package:school_planner/widgets/new_assessment_page_widgets/new_assessment_page_widgets.dart';

class NewAssessmentFormPages extends StatefulWidget {
  const NewAssessmentFormPages({super.key});

  // define tab state change function

  @override
  State<NewAssessmentFormPages> createState() => _NewAssessmentFormPagesState();
}

class _NewAssessmentFormPagesState extends State<NewAssessmentFormPages> {
  int selectedPage = 0;
  PageController pageController = PageController();

  
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

  @override
  Widget build(BuildContext context) {

    final newAssessmentFormHandler = FormHandler(formInput: {});
    newAssessmentFormHandler.formInput['date'] = null;

    return Expanded(
      child: Column(
        children: [
          NewAssessmentPageTabs(selectedTab: selectedPage, updateTabSelection: _updateSelectedPage),
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (pageIndex){
                setState(() {
                  selectedPage = pageIndex;
                });
              },
              children: [
                FormDescriptionPage(formHandler: newAssessmentFormHandler),
                FormDetailsPage(formHandler: newAssessmentFormHandler),
                FormDueDatePage(formHandler: newAssessmentFormHandler),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class FormDescriptionPage extends StatefulWidget {
  const FormDescriptionPage({super.key, required this.formHandler});

  final FormHandler formHandler;

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
                const SizedBox(height: 25),
                const Text('Title'),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Assignment 3',
                    hintStyle: TextStyle(color: Color(0x99FFFFFF)),
                    enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white)),
                  ),
                  validator: FormHandler.validateTextInput,
                  onSaved:(newValue){
                    if(newValue != null ){
                      widget.formHandler.formInput['title'] = newValue;
                    }
                  },
                ),
                const SizedBox(height: 25),
          
                // description field
                const Text('Description'),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'A 1500 word essay about the...',
                    hintStyle: TextStyle(color: Color(0x99FFFFFF)),
                    enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white)),
                  ),
                  validator: FormHandler.validateTextInput,
                  onSaved:(newValue){
                    if(newValue != null ){
                      widget.formHandler.formInput['title'] = newValue;
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
              onPressed: (){
                // navigate to next page after saving
              },
              child: const Text('Next'),
            ),
        ],
      ),
    );
  }
}

class FormDetailsPage extends StatefulWidget {
  const FormDetailsPage({super.key, required this.formHandler});
  
  final FormHandler formHandler;

  @override
  State<FormDetailsPage> createState() => _FormDetailsPageState();
}

class _FormDetailsPageState extends State<FormDetailsPage> {
  final _formKey = GlobalKey<FormState>();

  bool isFinished = false;

  void _updateVisibility(bool visible){
    setState(() {
      isFinished = visible;
    });
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
                const SizedBox(height: 25),
                const Text('Weight'),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Assignment 3',
                    hintStyle: TextStyle(color: Color(0x99FFFFFF)),
                    enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white)),
                  ),
                  validator: FormHandler.validateTextInput,
                  onSaved:(newValue){
                    if(newValue != null ){
                      widget.formHandler.formInput['title'] = newValue;
                    }
                  },
                ),
                const SizedBox(height: 25),
          
                // progress field
                Center(
                  child: NewAssessmentPageProgressSelector(formHandler: widget.formHandler, updateVisibilityFunction: _updateVisibility),
                ),
                const SizedBox(height: 25),

                // final grade field
                const Text('Final Grade'),
                TextFormField(
                  enabled: isFinished,
                  decoration: const InputDecoration(
                    hintText: '89.5',
                    hintStyle: TextStyle(color: Color(0x99FFFFFF)),
                    enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white)),
                  ),
                  validator: FormHandler.validateTextInput,
                  onSaved:(newValue){
                    if(newValue != null ){
                      widget.formHandler.formInput['title'] = newValue;
                    }
                  },
                ),
                const SizedBox(height: 25),

              ],
            ),
          ),

          // next page 
          ElevatedButton(
              onPressed: (){
                // navigate to next page after saving
              },
              child: const Text('Next'),
            ),
        ],
      ),
    );
  }
}

class FormDueDatePage extends StatefulWidget {
  const FormDueDatePage({super.key, required this.formHandler});

  final FormHandler formHandler;

  @override
  State<FormDueDatePage> createState() => _FormDueDatePageState();
}

class _FormDueDatePageState extends State<FormDueDatePage> {
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ElevatedButton(
        onPressed: (){
          // validateAssessment();
        },
        child: Text('submit'),
      )
    );
  }
}