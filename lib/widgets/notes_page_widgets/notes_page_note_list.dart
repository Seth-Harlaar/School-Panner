import 'package:flutter/material.dart';
import 'notes_page_widgets.dart';


class NotesPageNotesList extends StatelessWidget {
  const NotesPageNotesList({super.key});

  final List<String> notes = const ['Engineering', 'Philosophy', 'English', 'Chemistry'];


  List<Widget> get notesList {
    final List<Widget> notesWidgets = [];
    
    for (var note in notes){
      notesWidgets.add(NotesPageNoteCard(noteTitle: note, sneakPeek: 'sneakpeek', dateWritten: '12/12'));
    }

    return notesWidgets;
  }

  static TextStyle get subHeading {
    return TextStyle(
      fontSize: 15,
      color: Colors.grey[500],
    );
  }


  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),

      child: Column(
        children: notesList,
      )

    );
  }
}
