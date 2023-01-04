import 'package:isar/isar.dart';

part 'event.g.dart';

@collection
class Event {
  // id
  Id id = Isar.autoIncrement; 

  // date of event
  DateTime date;

  // type
  @enumerated
  EventType eventType;

  // time range
  // - holds the end time of the time range related to the event
  // - since isar cannot store time ranges
  // - is null if event type is dueDate
  DateTime? endTime;


  // Constructor
  Event({ required this.date, required this.eventType, required this.endTime });
}


enum EventType { dueDate, assessDate, doToday, happenToday }