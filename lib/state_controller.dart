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
  Student student = Student();

  // store average grade and number of courses in here

  @override 
  void initState(){
    super.initState();

    print('\n***reading student***\n');
    
    PersistanceController.readState().then((readData) {
      print('\n***finished reading***\n');
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

  // update student name
  void updateStudentName(String inputStudentName){
    // make a copy of the student with new name - keep other values same
    // Student newStudent = Student(programName: 'asdf', studentName: inputStudentName, currentYear: 1);

    setState((() => student = Student(programName: student.program, studentName: inputStudentName, currentYear: student.year)));
  }

  // make serialization method

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

