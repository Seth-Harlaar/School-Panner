import 'package:isar/isar.dart';

part 'assessment.g.dart';

@collection
class Assessment {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment
  
  String title;
  String description;
  int weight;

  DateTime? dueDate;

  double finalGrade;
  bool graded;
  
  @enumerated
  AssessmentType assessmentType;
  @enumerated
  AssessmentStatus assessmentStatus;


  // urgency and importance calculations go here

  // constructor
  Assessment({
    required this.title, required this.description, required this.weight, 
    required this.assessmentType, required this.assessmentStatus, required this.dueDate,
    
    this.finalGrade = 0, this.graded = false,
  });
}



enum AssessmentType { lab, test, assignment }

enum AssessmentStatus { notStarted, workingOn, almostDone, finished }