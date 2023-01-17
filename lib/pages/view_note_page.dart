import 'package:flutter/material.dart';
import 'package:school_planner/form_handler.dart';
import 'package:school_planner/models/note.dart';
import 'package:school_planner/widgets/app_bar.dart';
import 'package:school_planner/widgets/assets/assets.dart';
import 'package:school_planner/widgets/assets/custom_inputs.dart';
import 'package:school_planner/widgets/nav_bar.dart';


class ViewNotePage extends StatefulWidget {
  const ViewNotePage({super.key, required this.pageNote});

  final Note pageNote;

  @override
  State<ViewNotePage> createState() => _ViewNotePageState();
}

class _ViewNotePageState extends State<ViewNotePage> {
  
  final _formKey = GlobalKey<FormState>();
  bool changes = false;
  
  @override
  Widget build(BuildContext context) {
    final noteForm = FormHandler(formInput: {});

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppToolBar(), 
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            
            // page header and save button
            Row(
              children: [
                CustomHeader(
                  text: 'Page for: ${widget.pageNote.title}',
                  size: 1,
                ),
                IconButton(
                  icon: const Icon(Icons.save),
                  color: Colors.blue,
                  onPressed: (changes) ? 
                    (){
                      print("hi");
                    } :
                    null,
                ),
              ],
            ),
            
            // title and edit
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: widget.pageNote.title,
                    decoration: noteTitleDecoration(),
                    validator: FormHandler.validateTextInput,
                    onSaved:(newValue){
                      if(newValue != null ){
                        noteForm.formInput['title'] = newValue;
                      }
                    },
                  ),
                ),
                const IconButton(
                  icon: Icon(Icons.edit),
                  color: Colors.blue,
                  onPressed: null,
                ),
              ],
            ),

            // const SizedBox(height: 5),
            // TextFormField(
            //   initialValue: widget.pageNote.title,
            //   decoration: customFieldDecoration('a'),
            //   validator: FormHandler.validateTextInput,
            //   onSaved:(newValue){
            //     if(newValue != null ){
            //       noteForm.formInput['title'] = newValue;
            //     }
            //   },
            // ),
            // const SizedBox(height: 25),

            TextFormField(
              maxLines: 10,
              maxLength: 1000,
              initialValue: widget.pageNote.body,
              decoration: noteBodyDecoration(),
              validator: FormHandler.validateTextInput,
              onSaved: (newValue) {
                if(newValue != null ){
                  noteForm.formInput['body'] = newValue;
                }
              },
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),

      bottomNavigationBar: const NaVBar(),

    );
  }
}