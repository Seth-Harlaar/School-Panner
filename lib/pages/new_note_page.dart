import 'package:flutter/material.dart';
import 'package:school_planner/widgets/app_bar.dart';
import 'package:school_planner/widgets/assets/assets.dart';
import 'package:school_planner/widgets/nav_bar.dart';
import 'package:school_planner/widgets/new_note_form.dart';


class NewNotePage extends StatelessWidget {
  const NewNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppToolBar(), 
      ),
      
      body: Column(
        children: [
          const SizedBox(height: 25),
        
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LargePrimaryCard(
              child: Padding(
                padding: const EdgeInsets.all(8.0),

                // new note form
                child: Column(
                  children: const [
                    CustomHeader(
                      text: 'New Note Info', 
                      size: 1
                    ),
                    SizedBox(height: 25),
                    NewNoteForm(),
                  ],
                )
              )
            ),
          )
        ],
      ),

      bottomNavigationBar: const NaVBar(),
    );
  }
}