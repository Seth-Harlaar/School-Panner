import 'package:isar/isar.dart';
import 'package:school_planner/models/event.dart';

part 'assessment.g.dart';

@collection
class Assessment {
  Id id = Isar.autoIncrement;
  
  String title;
  String description;
  int weight;

  // replace with event
  DateTime? dueDate;

  double finalGrade;
  bool graded;

  int importance;
  int urgency;
  
  @enumerated
  AssessmentType assessmentType;
  @enumerated
  AssessmentStatus assessmentStatus;

  final event = IsarLink<Event>();


  // constructor
  Assessment({
    required this.title,    required this.description,      required this.assessmentType,
    required this.weight,   required this.assessmentStatus, required this.graded,         required this.finalGrade,
    required this.dueDate,
  })
    : importance = calculateImportance(weight, graded),
      urgency    = calculateUrgency(dueDate);
      // event      = createEvent(dueDate);


  // makes an event corresponding to the due date
  


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