import 'package:isar/isar.dart';

part 'assessment.g.dart';

@collection
class Assessment {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment
  
  String title;
  String description;
  int weight;
  int assessmentType;

  // constructor
  Assessment({required this.title, required this.description, required this.weight, required this.assessmentType});
}