import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  String id;
  String title;
  String uid;
  Timestamp date;
  String? dateString;
  String category;
  Timestamp? createAt;
  int countLongBreak;
  int countSession;
  int countShortBreak;

  TaskEntity(
      {required this.id,
      this.createAt,
      required this.uid,
      required this.title,
      required this.date,
      this.dateString,
      required this.category,
      required this.countLongBreak,
      required this.countSession,
      required this.countShortBreak});

  @override
  List<Object?> get props => [
        id,
        createAt,
        uid,
        title,
        date,
        dateString,
        category,
        countLongBreak,
        countSession,
        countShortBreak
      ];
}
