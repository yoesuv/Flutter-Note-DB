import 'package:equatable/equatable.dart';
import 'package:flutter_note/src/core/models/task_model.dart';

class HomeState extends Equatable {
  const HomeState({
    this.listTask = const [],
  });

  final List<TaskModel> listTask;

  HomeState copyWith({
    List<TaskModel>? listTask,
  }) {
    return HomeState(
      listTask: listTask ?? this.listTask,
    );
  }

  @override
  List<Object?> get props => [
        listTask,
      ];
}
