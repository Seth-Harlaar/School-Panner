
import 'package:school_planner/database_controller.dart';
import 'package:school_planner/models/assessment.dart';
import 'package:school_planner/models/course.dart';

class FormHandler {
  // make new form handler with empty map
  FormHandler({required this.formInput});


  // for storing input key value pairs
  Map<String, dynamic> formInput;




  // Form submissions
  // new course
  void submitCourse({required formKey}){
    final form = formKey.currentState;

    // save on validate
    if( form.validate() ){
      form.save();

      // make a new course from the info
      final newCourse = Course(title: formInput['title']);
      // Course({required this.title, required this.courseCode, this.hoursPerWeek = 0});

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

      // get weight and type
      final weight = int.parse(formInput['weight']);
      final type = int.parse(formInput['type']);

      // make a new assessment
      final newAssessment = Assessment(
        title: formInput['title'], 
        description: formInput['description'],
        weight: weight,
        assessmentType: type,
      );

      // then store new assessment in the appropriate course via the database controller
      final db = DbController();
      db.saveAssessment(newAssessment, courseId);
    }
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
        return 'You must enter a valid input';
      }

      return null;
    }
  }
}