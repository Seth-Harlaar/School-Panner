
import 'package:school_planner/database_controller.dart';
import 'package:school_planner/models/assessment.dart';
import 'package:school_planner/models/course.dart';
import 'package:school_planner/models/note.dart';

class FormHandler {
  // make new form handler with empty map
  FormHandler({required this.formInput});


  // for storing input key value pairs
  Map<String, dynamic> formInput;

  // Form submissions - new items
  // new course
  void submitCourse({required formKey}){
    final form = formKey.currentState;

    // save on validate
    if( form.validate() ){
      form.save();

      // make a new course from the info
      final newCourse = Course( 
        title: formInput['title'], courseCode: formInput['code'], 
        hoursPerWeek: int.parse(formInput['hours'])
      );

      // then store new course via the database controller
      final db = DbController();
      db.saveCourse(newCourse);
    }
  }

  // new assessment
  void submitAssessment({required formKey, required courseId}){
    final form = formKey.currentState;

    // save on validate
    if( form.validate() ){
      form.save();

      // make a new assessment
      final newAssessment = Assessment(
        title: formInput['title'], 
        description: formInput['description'],
        weight: int.parse(formInput['weight']),
        assessmentType: formInput['type'],
        assessmentStatus: formInput['status'],
        dueDate: formInput['date'],
        graded:           formInput['graded'],
        finalGrade:       formInput['finalGrade'] ?? 0,
      );

      // print(newAssessment);

      // then store new assessment in the appropriate course via the database controller
      // final db = DbController();
      // db.saveAssessment(newAssessment, courseId);
    }
  }

  // new assessment 2
  void submitAssessment2({required courseId}){

    // make a new assessment
    final newAssessment = Assessment(
      title:            formInput['title'], 
      description:      formInput['description'],
      weight:           int.parse(formInput['weight']),
      assessmentType:   formInput['type'],
      assessmentStatus: formInput['status'],
      dueDate:          formInput['date'],
      graded:           formInput['graded'],
      finalGrade:       double.parse(formInput['finalGrade'] ?? '0'),
    );

    print(newAssessment);

    // then store new assessment in the appropriate course via the database controller
    final db = DbController();
    db.saveAssessment(newAssessment, courseId);
  }

  void submitNote({required formKey}){
    final form = formKey.currentState;

    if( form.validate() ){
      form.save();

      // make a new note
      final newNote = Note(
        title: formInput['title'],
        body: formInput['body'],
        created: DateTime.now(),
      );

      final db = DbController();
      db.saveNote(newNote);
    }
  }




  // Form updates
  // update assessment grade
  void updateAssessmentGrade({required int id}){
    
    // get grade input
    final double inputGrade = double.parse(formInput['grade']);

    // get assessment
    final db = DbController();

    // store grade
    db.saveUpdatedAssessmentGrade(assessmentId: id, finalGrade: inputGrade);
  }


  // Input validations
  static String? validateTextInput(String? input){
    if( input == null || input.isEmpty ){
        return 'An input for this field is required';
    } else {
      return null;
    }
  }

  static String? validateIntegerInput(String? input){
    if( input == null || input.isEmpty ){
        return 'An input for this field is required';
    } else {

      final inputInt = int.tryParse(input);
      if(inputInt == null){
        return 'You must enter a valid integer input';
      }

      return null;
    }
  }

  static String? validateDoubleInput(String? input){
    if( input == null || input.isEmpty ){
        return 'An input for this field is required';
    } else {

      final inputDouble = double.tryParse(input);
      if(inputDouble == null){
        return 'You must enter a valid integer input';
      }

      return null;
    }
  }
}