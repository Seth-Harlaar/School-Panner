import 'package:flutter/material.dart';
import 'package:school_planner/themes.dart';


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
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
        color: Color(0xFF3D3D3D),

        child: Padding(
          padding: const EdgeInsets.all(10.0),
      
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Text( noteTitle, style: CustomTextStyles.headerTwo ),
                  Text( sneakPeek, style: CustomTextStyles.subHeading ),
                ],
              ),
      
              const Spacer( flex: 5),

              Text(
                dateWritten,
                style: const TextStyle(
                  fontSize: 25,
                )
              ),
      
      
            ],
            
          )
        ),
      ),
    );
  }
}