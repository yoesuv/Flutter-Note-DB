import 'dart:async';

import 'package:flutter_note/main.dart';
import 'package:flutter_note/objectbox.g.dart';
import 'package:flutter_note/src/core/models/task_model.dart';

class DbTaskRepository {
  late final _taskBox = Box<TaskModel>(appObjectBox.store);

  Future<List<TaskModel>> getListTask() async {
    return _taskBox.getAll();
  }

  Future<void> insertTask(TaskModel taskModel) async {
    await _taskBox.putAsync(taskModel, mode: PutMode.insert);
  }

  Future<void> updateTask(TaskModel taskModel) async {
    await _taskBox.putAsync(taskModel, mode: PutMode.update);
  }

  Future<void> deleteTask(int id) async {
    await _taskBox.removeAsync(id);
  }

  Future<void> deleteAllTask() async {
    await _taskBox.removeAllAsync();
  }
}
