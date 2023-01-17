import 'package:isar/isar.dart';

part 'note.g.dart';

@collection
class Note {
  // id
  Id id = Isar.autoIncrement; 

  // text
  String title;
  String body;

  // date of creation
  DateTime created;

  // # of chars
  int size;


  // Constructor
  Note({ required this.title, required this.body, required this.created })
    : size = title.length;
}
