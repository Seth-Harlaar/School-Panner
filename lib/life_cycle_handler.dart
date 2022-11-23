import 'package:flutter/material.dart';
import 'package:school_planner/persistance_controller.dart';
import 'package:school_planner/state_controller.dart';
import 'dart:convert';

// widget for observing life cycle of app
class LifeCycleHandler extends StatefulWidget {
  final Widget child;
  
  const LifeCycleHandler({
    super.key, 
    required this.child
  });

  @override
  State<LifeCycleHandler> createState() => _LifeCycleHandlerState();
}

class _LifeCycleHandlerState extends State<LifeCycleHandler> with WidgetsBindingObserver {
  // the life cycle history
  final List<AppLifecycleState> _stateHistoryList = <AppLifecycleState>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // add initial life cycle to history list
    if (WidgetsBinding.instance.lifecycleState != null) {
      _stateHistoryList.add(WidgetsBinding.instance.lifecycleState!);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    // add state on changes to life cycle
    setState(() {
      _stateHistoryList.add(state);
    });

    // serialize state and store it
    final AppState? appState = AppStateContainer.of(context);

    final String stateString = jsonEncode(appState?.student.toJson());


    // for now test saving and loading file
    try {
      PersistanceController.storeState(stateString);
      print('\n***saving file success***\n');
    } catch (e) {
      print('\n***failed to save data to the file in the life_cycle_handler***\n');
    }

    print('\n***finished writing***\n');
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
