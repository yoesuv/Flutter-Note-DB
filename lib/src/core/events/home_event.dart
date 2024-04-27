import 'package:equatable/equatable.dart';
import 'package:flutter_note/src/core/models/task_model.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitEvent extends HomeEvent {}

class HomeInsertEvent extends HomeEvent {
  HomeInsertEvent({this.taskModel});
  final TaskModel? taskModel;
  @override
  List<Object?> get props => [taskModel];
}
