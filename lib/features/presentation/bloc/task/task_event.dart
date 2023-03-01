// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {}

class CreateTaskButtonPressed extends TaskEvent {
  String title;
  String id;
  String uid;
  Timestamp date;
  String dateString;
  String category;
  int countLongBreak;
  int countSession;
  int countShortBreak;
  CreateTaskButtonPressed({
    required this.id,
    required this.title,
    required this.uid,
    required this.date,
    required this.dateString,
    required this.category,
    required this.countLongBreak,
    required this.countSession,
    required this.countShortBreak,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        uid,
        date,
        dateString,
        category,
        countLongBreak,
        countSession,
        countShortBreak,
      ];
}

class GetAllTask extends TaskEvent {
  String userId;
  String date;
  GetAllTask({
    required this.userId,
    required this.date,
  });

  @override
  List<Object?> get props => [userId, date];
}
