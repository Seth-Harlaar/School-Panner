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

  int importance;
  int urgency;
  
  @enumerated
  AssessmentType assessmentType;
  @enumerated
  AssessmentStatus assessmentStatus;


  // constructor
  Assessment({
    required this.title, required this.description, required this.weight, 
    required this.assessmentType, required this.assessmentStatus, required this.dueDate,
    
    this.finalGrade = 0, this.graded = false,
  })
    : importance = calculateImportance(weight, graded),
      urgency    = calculateUrgency(dueDate);



  // calculates how important the assessment is based on weight
  static int calculateImportance(int weight, bool graded){
    if( graded == true ){
      return 0;
    }
    if( weight > 25 ){
      return 4;
    } 
    if( weight > 15 ){
      return 3;
    }
    if( weight > 5 ){
      return 2;
    }
    return 1;
  }

  // calculates how urgent the assessment is based on due date
  // -1: overdue  0: no date given  1: [9+]  2: [6-8]  3: [2-5]  4: [0,1]
  static int calculateUrgency(DateTime? dueDate){
    if( dueDate == null ){
      return 0;
    }
    final daysTillDue = dueDate.difference(DateTime.now()).inDays;

    if(daysTillDue < 0){
      return -1;
    }

    if(daysTillDue > 8){
      return 1;
    }
    if(daysTillDue > 5){
      return 2;
    }
    if(daysTillDue > 1 ){
      return 3;
    }    
    return 4;
  }
}

enum AssessmentType { lab, test, assignment }
enum AssessmentStatus { notStarted, workingOn, almostDone, finished }