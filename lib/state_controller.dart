import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:school_planner/models/student.dart';
import 'package:school_planner/persistance_controller.dart';

// a container for state
class AppStateContainer extends StatefulWidget {
  final Widget child;

  const AppStateContainer({
    super.key,
    required this.child,
  });

  @override
  State<StatefulWidget> createState() => AppState();

  static AppState? of(BuildContext context){
    return (context.dependOnInheritedWidgetOfExactType<_AppStoreContainer>())?.appData;
  }
}

// the state
class AppState extends State<AppStateContainer> {
  
  // *** data variables ***
  // store average grade and number of courses in here
  Student student = Student();

  // navbar current page
  List<String> navLocationRoutes = ['/homepage', '/newCoursePage', '/addNewRoute', '/settings'];
  NavLocation curLocation = NavLocation.home;

  @override 
  void initState(){
    super.initState();

    // read state info from file    
    PersistanceController.readState().then((readData) {
      student = Student.fromJson(jsonDecode(readData));
      print('\n***loaded student from read***\n');
    });
  }

  @override
  Widget build(BuildContext context) {
    return _AppStoreContainer(
      appData: this,
      child: widget.child,
    );
  }

  // *** data methods ***
  // make serialization method

  // update student name
  void updateStudentName(String inputStudentName){
    // make a copy of the student with new name - keep other values same
    setState((() => student = Student(programName: student.program, studentName: inputStudentName, currentYear: student.year)));
  }

  void updateCurrentLocation(int navIndex){
    setState(() => curLocation = NavLocation.values[navIndex] );
  }

  void updateCustomLocation(String newLocation){
    setState(() => navLocationRoutes[1] = newLocation);
  }

}



// a container for the rest of the app
class _AppStoreContainer extends InheritedWidget {
  
  final AppState appData;
  
  const _AppStoreContainer({
    required super.child,
    required this.appData,
  });

  @override
  bool updateShouldNotify(_AppStoreContainer oldWidget) => true;
}



enum NavLocation {home, custom, add, settings}