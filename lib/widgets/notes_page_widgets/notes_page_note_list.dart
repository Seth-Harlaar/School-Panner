import 'package:flutter/material.dart';
import 'notes_page_widgets.dart';


class NotesPageNotesList extends StatelessWidget {
  const NotesPageNotesList({super.key});

  final List<String> notes = const ['Engineering', 'Philosophy', 'English', 'Chemistry'];


  List<Widget> get notesList {
    final List<Widget> notesWidgets = [];
    
    for (var note in notes){
      notesWidgets.add(NotesPageNoteCard(noteTitle: note, sneakPeek: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mattis lacus, non tempus velit. Nam nibh mi, mattis vitae fringilla non, sodales id dui. Aenean enim tortor, tincidunt sit amet ante nec, eleifend ornare arcu. Vivamus erat magna, tincidunt et scelerisque vel, malesuada sit amet libero. Morbi aliquet leo sapien, in malesuada sem pulvinar ac. Phasellus et tincidunt lectus. Nullam vitae eros a enim dictum consequat. Fusce tortor mauris, fermentum at mattis sit amet, semper semper quam. Interdum et malesuada fames ac ante ipsum primis in faucibus. In dui nunc, semper et lorem vel, pharetra semper tortor. ', dateWritten: '12/12'));
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
      padding: const EdgeInsets.symmetric(horizontal: 20.0),

      child: Column(
        children: notesList,
      )
    );
  }
}
