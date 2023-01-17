import 'package:flutter/material.dart';
import 'package:school_planner/database_controller.dart';
import 'package:school_planner/models/note.dart';
import 'notes_page_widgets.dart';


class NotesPageNotesList extends StatefulWidget {
  const NotesPageNotesList({super.key});

  @override
  State<NotesPageNotesList> createState() => _NotesPageNotesListState();
}

class _NotesPageNotesListState extends State<NotesPageNotesList> {
  late Future<List<Note>> notesList;

  late Stream<void> courseChange;

  @override
  void initState(){
    super.initState();

    final db = DbController();
    notesList = db.getAllNotes();

    // get required info
    db.dataBase.then((isar){
      courseChange = isar.notes.watchLazy();
      courseChange.listen((event) { 
        // print("\n ** Notes change");
        setState(() {
          notesList = db.getAllNotes();
        });
      });
    });
  }




  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),

      child: FutureBuilder<List<Note>>(
        future: notesList,
        
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.length,
              shrinkWrap: true,
              itemBuilder:(context, index) {
                final note = snapshot.data?[index];
                if( note != null ){
                  return NotesPageNoteCard(note: note);
                } else {
                  return const Text('This note could not be rendered');
                }
              },
            );
            
          } else if (snapshot.hasError){
            return Text('Error with future builder: ${snapshot.error}');
          }

          return const CircularProgressIndicator();
        }
      ),
    );
  }
}
