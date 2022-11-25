import 'package:isar/isar.dart';
import 'package:school_planner/models/assessment.dart';

part 'course.g.dart';

@collection
class Course {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  // Title
  String title;
  String courseCode;
  int hoursPerWeek;

  // link to assessments
  final assessments = IsarLinks<Assessment>();

  Course({required this.title, this.courseCode = 'none yet', this.hoursPerWeek = 0});
}
