import 'package:flutter/material.dart';
import 'package:school_planner/models/note.dart';
import 'package:school_planner/themes.dart';
import 'package:school_planner/widgets/assets/assets.dart';


class NotesPageNoteCard extends StatelessWidget {
  const NotesPageNoteCard({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      // navigate to clicked on note
      onTap: (){

      },

      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        color: const Color(0xFF3D3D3D),
    
        child: ListTile(
          title: CustomHeader(
            text: note.title,
            size: 2,
          ),
          isThreeLine: true,
    
          subtitle: Text(
            note.body,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
    
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${note.created.day}/${note.created.month}',
              )
            ]
          ),
        ),
      ),
    );
  }
}