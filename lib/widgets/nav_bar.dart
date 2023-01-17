import 'package:flutter/material.dart';
import 'package:school_planner/state_controller.dart';
import 'package:school_planner/widgets/assets/assets.dart';


class NaVBar extends StatelessWidget {
  const NaVBar({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0x00FFFFFF),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _customNavBarItems(context),
      ),
    );
  }
  
  // build the nav bar nav items
  List<Widget> _customNavBarItems(BuildContext context){
    // get the app state
    final AppState? appState = AppStateContainer.of(context);
    final int curLocIndex = appState?.curLocation.index ?? 0;

    List<Widget> navBarItems = [];

    // build 4 of them
    for(var i = 0; i < 4; i++){
      navBarItems.add(

        GestureDetector(
          // tap for immediate navigation
          onTap:() {
            // open menu to nav to desired form - on third one only
            if(appState != null){
              if(i == 2){
                showDialog(
                  context: context,
                  builder: (_) => _formRouteDialog(context),
                  barrierDismissible: true,
                );
              // navigate to desired location
              } else {
                // udpate cur location
                appState.updateCurrentLocation(i);
                Navigator.pushNamed(context, appState.navLocationRoutes[i]);
              }
            }
          },

          // long press on second only for configuration
          onLongPress: () {
            if(i == 1){
              showDialog(
                context: context,
                builder: (_) => _configureRouteDialog(context),
                barrierDismissible: true,
              );
            }
          },

          // button design
          child: Container(
            color: (i == curLocIndex)? const Color(0xFFFFC72A) : Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text('hi $i'),
            ),
          ),
        )
      );
    }

    return navBarItems;
  }



  
  // dialog for navigation to forms
  Widget _formRouteDialog(BuildContext context){
    return AlertDialog(
      backgroundColor: const Color(0xFF3D3D3D),
      elevation: 24,

      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _formRouteDialogItems(context),
      ),
    );
  }

  // list of options for forms on the formRouteDialog
  List<Widget> _formRouteDialogItems(BuildContext context){
    // return list
    List<Widget> items = [];

    // item info
    List<String> routes = ['/newCoursePage', '/newAssessmentPage' ,'/newNotePage'];
    List<String> itemNames = ['Course', 'Assessment', 'Note'];

    // for every form
    for(var i = 0; i < 3; i++){
      items.add(
        GestureDetector(
          onTap:() {
            // get state and update current page
            final AppState? appState = AppStateContainer.of(context);
            if(appState != null){
              appState.updateCurrentLocation(2);
            }
            Navigator.pop(context);
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



  // dialog for selected new destination
  Widget _configureRouteDialog(BuildContext context){
    return AlertDialog(
      backgroundColor: const Color(0xFF3D3D3D),
      elevation: 24,

      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _configureRouteItems(context),
      ),
    );
  }

  // list of options to configure second nav button to
  List<Widget> _configureRouteItems(BuildContext context){
    // return list
    List<Widget> items = [];

    // item info
    List<String> routes = ['/gradesPage', '/notesPage', '/chartsPage', '/calenderPage'];
    List<String> itemNames = ['Grades Page', 'Notes Page', 'Charts Page', 'Calender Page'];

    // for every form
    for(var i = 0; i < itemNames.length; i++){
      items.add(
        GestureDetector(
          onTap:() {
            // get state and update custom route
            final AppState? appState = AppStateContainer.of(context);
            if(appState != null){
              appState.updateCustomLocation(routes[i]);
            }
            Navigator.pop(context);
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
}


