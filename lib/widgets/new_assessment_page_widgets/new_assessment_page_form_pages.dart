import 'package:flutter/material.dart';
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
              children: const [
                FormDescriptionPage(),
                FormDetailsPage(),
                FormDueDatePage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class FormDescriptionPage extends StatelessWidget {
  const FormDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('hi page 1');
  }
}

class FormDetailsPage extends StatelessWidget {
  const FormDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('hi page 2');
  }
}

class FormDueDatePage extends StatelessWidget {
  const FormDueDatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('hi page 3');
  }
}