import 'package:isar/isar.dart';
import 'package:school_planner/models/assessment.dart';
import 'package:school_planner/models/course.dart';
import 'package:school_planner/models/note.dart';
import 'package:school_planner/models/event.dart';




class DbController {
  // a reference to the db
  late Future<Isar> dataBase;

  // constructor to open the db
  DbController() {
    dataBase = openDataBase();
  }


  // CRUD operations
  // * * * Create * * *
  void saveCourse(Course newCourse) async {
    final db = await dataBase;
    db.writeTxn(() async {
      await db.courses.put(newCourse);
    });
  }

  void saveAssessment(Assessment newAssessment, int courseId) async {
    final db = await dataBase;
    db.courses.get(courseId).then((course){
      if(course != null){

        course.assessment.add(newAssessment);
        db.writeTxn(() async {
          await db.assessments.put(newAssessment);
          await course.assessment.save();
        });

      } else {
        print("could not find course with that id");
      }
    });
  }

  void saveNote(Note newNote) async {
    final db = await dataBase;
    db.writeTxn(() async {
      await db.notes.put(newNote);
    });
  }


  // * * * Read * * *

  // returns a reference to a specific course
  Future<Course> getCourse(int index) async {
    final db = await dataBase;

    final course = await db.courses.get(index);
    return Future.value(course);
  }

  // returns a list of all the courses in the collection
  Future<List<Course>> getAllCourses() async {
    final db = await dataBase;

    final course = await db.courses.where().findAll();
    // final courses = await db.assessments.where().findAll();
    return Future.value(course);
  }

  // returns # of courses in the collection
  Future<int> getCourseCount() async {
    final db = await dataBase;

    final courseCount = await db.courses.where().count();
    return Future.value(courseCount);
  }

  // return all assessments for a course
  Future<List<Assessment>> getAllAssessForCourse(Course course) async {
    Future<List<Assessment>> assessments = course.assessment.filter().findAll();
    return assessments;
  }

  Future<List<Note>> getAllNotes() async {
    final db = await dataBase;
    
    final notes = await db.notes.where().findAll();
    return Future.value(notes);
  }


  // * * * Update * * *
  void saveUpdatedAssessmentGrade({required int assessmentId, required double finalGrade}) async {
    final db = await dataBase;
    final assessment = await db.assessments.get(assessmentId);

    if( assessment != null ){
      db.writeTxn(() async {
        // update final grade and status
        assessment.finalGrade = finalGrade;
        assessment.assessmentStatus = AssessmentStatus.finished;
        assessment.graded = true;
        await db.assessments.put(assessment);
      });

    } else {
      print('no assessment found');
    }
  }





  // * * * Setup * * *
  // open the db
  Future<Isar> openDataBase() async {
    // if there are no schemas open open them
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [CourseSchema, AssessmentSchema, EventSchema, NoteSchema],
        inspector: true,
      );
    }

    // else return the ones available
    return Future.value(Isar.getInstance());
  }
}