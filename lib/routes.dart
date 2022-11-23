import 'package:school_planner/pages/notes_page.dart';
import 'package:seafarer/seafarer.dart';
import 'package:school_planner/pages/screens.dart';

class Routes {
  static final seafarer = Seafarer();

  static void createRoutes() {
    seafarer.addRoute(SeafarerRoute(
      name: "/gradesPage",
      builder: (context, args, params) {
        return GradesPage();
      },
    ));

    seafarer.addRoute(SeafarerRoute(
      name: "/notesPage",
      builder: (context, args, params) {
        return NotesPage();
      },
    ));

    seafarer.addRoute(SeafarerRoute(
      name: "/newCoursePage",
      builder: (context, args, params) {
        return NewCoursePage();
      },
    ));

    seafarer.addRoute(SeafarerRoute(
      name: "/newStudentPage",
      builder: (context, args, params) {
        return NewStudentPage();
      },
    ));

    seafarer.addRoute(SeafarerRoute(
      name: "/calenderPage",
      builder: (context, args, params) {
        return CalenderPage();
      },
    ));
  }
}

