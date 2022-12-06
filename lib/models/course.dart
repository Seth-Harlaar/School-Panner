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

  // move add assessment methods to here instead of directly through db controller



  // methods

  // calculate avg/abs grade
  void calculateAverageGrade() async {
    double points = 0.0;
    double weight = 0.0;

    // get all grade
    for(var assess in assessment){
      if(assess.graded){
        absGrade += assess.finalGrade*(assess.weight/100);
        weight += assess.weight;
      }
    }
    // avg
    curGrade = points/weight;
    // abs
    absGrade = points/100;
  }
}