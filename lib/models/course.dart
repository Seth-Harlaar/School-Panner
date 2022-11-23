import 'package:isar/isar.dart';

part 'course.g.dart';

@collection
class Course {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  // Title
  String title;
  String courseCode;
  int hoursPerWeek;

  Course({required this.title, this.courseCode = 'none yet', this.hoursPerWeek = 0});
}
