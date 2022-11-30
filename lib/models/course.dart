import 'package:isar/isar.dart';
import 'package:school_planner/models/assessment.dart';

part 'course.g.dart';

@collection
class Course {
  // constructor
  Course({
    required this.title, required this.courseCode, required this.hoursPerWeek, 
    this.curGrade = 0.0, this.absGrade = 0.0
  });

  // id
  Id id = Isar.autoIncrement; 

  // form info
  String title;
  String courseCode;
  int hoursPerWeek;

  double curGrade;
  double absGrade;

  // link to assessments
  final assessment = IsarLinks<Assessment>();

  // move add assessment course methods to here instead of directly through db controller

  // methods

  // calculate avg grade

  // calculate abs grade
}