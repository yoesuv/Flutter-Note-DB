import 'dart:async';

import 'package:flutter_note/objectbox.g.dart';
import 'package:flutter_note/src/core/models/task_model.dart';

class TaskRepository {
  late final Store _store;
  late final Box<TaskModel> _taskBox;

  TaskRepository._create(this._store) {
    _taskBox = Box<TaskModel>(_store);
  }

  static Future<TaskRepository> create() async {
    final store = await openStore();
    return TaskRepository._create(store);
  }

  Future<List<TaskModel>> getListTask() async {
    return _taskBox.getAll();
  }

  void insertTask(TaskModel taskModel) {
    _taskBox.put(taskModel);
  }
}
