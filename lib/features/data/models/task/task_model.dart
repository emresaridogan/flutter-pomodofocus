import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pomodofocus/features/domain/entities/task/task_entity.dart';

class TaskModel extends TaskEntity {
  @override
  String id;
  @override
  Timestamp? createAt;
  @override
  String title;
  @override
  String uid;
  @override
  String date;
  @override
  String time;

  @override
  String category;
  @override
  int countLongBreak;
  @override
  int countSession;
  @override
  int countShortBreak;

  TaskModel(
      {required this.id,
      this.createAt,
      required this.uid,
      required this.title,
      required this.date,
      required this.time,
      required this.category,
      required this.countLongBreak,
      required this.countSession,
      required this.countShortBreak})
      : super(
          createAt: createAt,
          uid: uid,
          id: id,
          title: title,
          date: date,
          time: time,
          category: category,
          countLongBreak: countLongBreak,
          countSession: countSession,
          countShortBreak: countShortBreak,
        );

  factory TaskModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return TaskModel(
      category: snapshot['category'] ?? '',
      countLongBreak: snapshot['countLongBreak'] ?? 0,
      countSession: snapshot['countSession'] ?? 0,
      countShortBreak: snapshot['countShortBreak'] ?? 0,
      date: snapshot['date'] ?? '',
      createAt: snapshot['createAt'] ?? '',
      id: snapshot['id'] ?? '',
      time: snapshot['time'] ?? '',
      title: snapshot['title'] ?? '',
      uid: snapshot['uid'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "createAt": createAt,
        "title": title,
        "date": date,
        "time": time,
        "category": category,
        "countLongBreak": countLongBreak,
        "countSession": countSession,
        "countShortBreak": countShortBreak,
      };
}
