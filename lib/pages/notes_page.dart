import 'package:flutter/material.dart';
import 'package:school_planner/state_controller.dart';
import 'package:school_planner/widgets/app_bar.dart';
import 'package:school_planner/widgets/notes_page_widgets/notes_page_widgets.dart';


class NotesPage extends StatelessWidget {
  
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context){
    final AppState? appState = AppStateContainer.of(context);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppToolBar(), 
      ),

      body: Column(
        children: [
          const SizedBox(height: 25,),
          NotesPageSorting(),
          const SizedBox(height: 25,),
          NotesPageNotesList(),
          const SizedBox(height: 25,),
          FloatingActionButton(
            onPressed:() {
            },
            
          )
        ],
      ),
    );
  }
}
