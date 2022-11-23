import 'package:isar/isar.dart';
import 'package:school_planner/models/course.dart';




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


  // * * * Read * * *

  // returns a reference to a specific course
  Future<Course> getCourse(int index) async {
    final db = await dataBase;

    final course = await db.courses.get(1);
    return Future.value(course);
  }

  // returns a list of all the courses in the collection
  Future<List<Course>> getAllCourses() async {
    final db = await dataBase;

    final course = await db.courses.where().findAll();
    return Future.value(course);
  }

  // returns # of courses in the collection
  Future<int> getCourseCount() async {
    final db = await dataBase;

    final courseCount = await db.courses.where().count();
    return Future.value(courseCount);
  }


  // * * * Setup * * *
  // open the db
  Future<Isar> openDataBase() async {
    // if there are no schemas open open them
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [CourseSchema],
        inspector: true,
      );
    }

    // else return the ones available
    return Future.value(Isar.getInstance());
  }
}