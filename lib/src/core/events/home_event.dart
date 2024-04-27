import 'package:equatable/equatable.dart';
import 'package:flutter_note/src/core/models/task_model.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitEvent extends HomeEvent {}

class HomeInsertEvent extends HomeEvent {
  HomeInsertEvent({required this.taskModel});
  final TaskModel taskModel;
  @override
  List<Object?> get props => [taskModel];
}

class HomeDeleteEvent extends HomeEvent {
  HomeDeleteEvent({required this.id});
  final int id;
  @override
  List<Object?> get props => [id];
}

class HomeDeleteAllEvent extends HomeEvent {}
