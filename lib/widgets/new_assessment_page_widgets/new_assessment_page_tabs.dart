import 'package:flutter/material.dart';


// tab controller for new assessment page
class NewAssessmentPageTabs extends StatelessWidget {
  const NewAssessmentPageTabs({super.key, required this.selectedTab});
  
  final int selectedTab;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: _tabListBuilder(context),
    );
  }


  List<Widget> _tabListBuilder(BuildContext context){
    final tabList = List<Widget>.generate(
      3,
      (i){
        return _tabBuilder((i == selectedTab) ? true : false, i, context );
      }
    );
    return tabList;
  }

  Widget _tabBuilder(bool selected, int tabIndex, BuildContext context){
    final List<String> tabNames = ['Description', 'Details', 'Due Date'];

    return Expanded(
      flex: (selected ? 4:3),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            border: (selected? const Border(
              bottom: BorderSide(width: 2, color: Color(0xFFFFC72A)),
            ) : null)
          ), 

          child: Container(
            decoration: BoxDecoration(
              color: (selected? const Color(0xFF3D3D3D) : const Color(0xFF2E2E2E)),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(7), topRight: Radius.circular(7)),
              // border: Border(
              //   bottom: BorderSide(width: 16.0, color: Colors.lightBlue.shade900),
              // ),
            ),
            width: MediaQuery.of(context).size.width * (selected ? 0.4 : 0.3),
            
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: (selected? 15: 10)),
              child: Center(
                child: Text(tabNames[tabIndex])
              ),
            ),
          ),
        ),
      ),
    );
  }
}
