import 'package:cloud_firestore/cloud_firestore.dart';

///data class
class Task{
  static const String collectionName = "tasks";

  String id;
  String title;
  String description;
  DateTime dateTime;
  bool isDone;

  Task({this.id = '',required this.title, required this.description,
    required this.dateTime, this.isDone = false});

  ///func object -> json
  Task.FromFireStore(Map<String, dynamic> data):this(
    id: data["id"] as String,
    title: data["title"] as String,
    description: data["description"] as String,
      dateTime: data["dateTime"] is Timestamp
          ? (data["dateTime"] as Timestamp).toDate()
          : DateTime.fromMillisecondsSinceEpoch(data["dateTime"] as int),  // Handle int case
    // dateTime: (data["dateTime"] as Timestamp).toDate(),
      //DateTime.fromMillisecondsSinceEpoch(data["dateTime"]),
    isDone: data["isDone"] as bool
  );

  ///func object -> json
  Map<String, dynamic> toFireStore(){
    return {
      "id" : id,
      "title" : title,
      "description" : description,
      "dateTime": Timestamp.fromDate(dateTime),  // Save as Firestore Timestamp
      // "dateTime" : dateTime,
      //Timestamp.fromDate(dateTime),
      "isDone" : isDone,
    };
  }
}