import 'package:flutter/material.dart';
import 'package:school_planner/state_controller.dart';
import 'package:school_planner/widgets/assets/assets.dart';


class NaVBar extends StatelessWidget {
  const NaVBar({super.key});


  // widget for navigation to forms
  Widget _formRouteDialog(BuildContext context){
    return AlertDialog(
      backgroundColor: const Color(0xFF3D3D3D),
      elevation: 24,

      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _formRouteDialogItem(context),
      ),
    );
  }

  List<Widget> _formRouteDialogItem(BuildContext context){
    // return list
    List<Widget> items = [];

    // item info
    List<String> routes = ['/newCoursePage', '/newAssessmentPage' ,'/notesPage'];
    List<String> itemNames = ['Course', 'Assessment', 'Note'];

    for(var i = 0; i < 3; i++){
      items.add(
        GestureDetector(
          onTap:() {
            Navigator.pushNamed(context, routes[i]);
          },
          child: Container(
            color: Colors.black,
            child: CustomHeader(
              size: 2,
              text: itemNames[i],
            )
          )
        )
      );
      if(i != 3){
        items.add(const SizedBox(height: 10));
      }
    }

    return items;
  }


  List<Widget> _customNavBarItem(BuildContext context){
    // get the app state
    final AppState? appState = AppStateContainer.of(context);
    
    final int curLocIndex = appState?.curLocation.index ?? 0;

    List<Widget> navBarItems = [];

    for(var i = 0; i < 4; i++){
      navBarItems.add(
        GestureDetector(
          onTap:() {
            // open menu to nav to desired form
            if(i == 2){
              showDialog(
                context: context,
                builder: (_) => _formRouteDialog(context),
                barrierDismissible: true,
              );
            }
            
            if(appState != null){
              // udpate cur location
              appState.updateCurrentLocation(i);
              Navigator.pushNamed(context, appState.navLocationRoutes[i]);
            }
          },
          child: Container(
            color: (i == curLocIndex)? const Color(0xFFFFC72A) : Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text('hi $i'),
            ),
          ),
        )
      );
      if(i != 3){
        navBarItems.add(const SizedBox(width: 10));
      }
    }

    return navBarItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _customNavBarItem(context),
      ),
    );
  }
}


