
import 'package:school_planner/database_controller.dart';
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

  // Input validations
  static String? validateTextInput(String? input){
    if( input == null || input.isEmpty ){
        return 'Field must not be empty';
    } else {
      return null;
    }
  }
}