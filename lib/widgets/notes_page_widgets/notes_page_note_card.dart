import 'package:flutter/material.dart';
import 'package:school_planner/themes.dart';
import 'package:school_planner/widgets/assets/assets.dart';


class NotesPageNoteCard extends StatelessWidget {
  const NotesPageNoteCard({
    super.key,
    required this.noteTitle,
    required this.sneakPeek,
    required this.dateWritten
  });

  final String noteTitle;
  final String sneakPeek;
  final String dateWritten;

  @override
  Widget build(BuildContext context) {

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      color: const Color(0xFF3D3D3D),

      child: ListTile(
        title: CustomHeader(
          text: noteTitle,
          size: 2,
        ),
        isThreeLine: true,

        subtitle: Text(
          sneakPeek,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),

        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dateWritten
            )
          ]
        ),
      ),
    );
  }
}