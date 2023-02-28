// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/task/task_entity.dart';
import '../../models/task/task_model.dart';

abstract class FirebaseService {
  Future<bool> createTask(TaskEntity task);
  Future<List<TaskEntity>> getTasks(String uid, date);
}

class FirebaseServiceImpl extends FirebaseService {
  FirebaseFirestore firebaseFirestore;
  FirebaseServiceImpl({required this.firebaseFirestore});

  @override
  Future<List<TaskEntity>> getTasks(String uid, date) {
    return _getTasks(uid, date);
  }

  Future<List<TaskEntity>> _getTasks(String uid, date) async {
    QuerySnapshot query = await firebaseFirestore
        .collection('Tasks')
        .where('uid', isEqualTo: uid)
        .where('dateString', isEqualTo: date)
        .orderBy("date")
        .get();
    return query.docs.map((e) => TaskModel.fromSnapshot(e)).toList();
  }

  @override
  Future<bool> createTask(TaskEntity task) {
    return _createTask(task);
  }

  @override
  Future<bool> _createTask(TaskEntity task) async {
    final taskCollection = firebaseFirestore.collection('Tasks');
    bool isDone = false;
    final newTask = TaskModel(
      category: task.category,
      countLongBreak: task.countLongBreak,
      countSession: task.countSession,
      countShortBreak: task.countShortBreak,
      date: task.date,
      dateString: task.dateString,
      title: task.title,
      uid: task.uid,
      id: task.id,
      createAt: Timestamp.now(),
    ).toJson();

    try {
      final taskDocRef = await taskCollection.doc(task.id).get();
      print(task.id);
      if (!taskDocRef.exists) {
        taskCollection.doc(task.id).set(newTask).then((value) {
          final userCollection =
              firebaseFirestore.collection('Users').doc(task.uid);

          userCollection.get().then((value) {
            if (value.exists) {
              final totalTasks = value.get('totalTasks');
              userCollection.update({'totalTasks': totalTasks + 1});
              return true;
            }
          });
        });
      } else {
        taskCollection.doc(task.id).update(newTask);
        return true;
      }
    } catch (e) {
      print("some error occured $e");
    }
    return isDone;
  }
}
