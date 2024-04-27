import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note/src/core/db/db_task_repository.dart';
import 'package:flutter_note/src/core/events/home_event.dart';
import 'package:flutter_note/src/core/states/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  DbTaskRepository dbTask = DbTaskRepository();

  HomeBloc() : super(const HomeState()) {
    on<HomeInitEvent>(_onInit);
    on<HomeInsertEvent>(_onInsert);
    on<HomeDeleteEvent>(_onDelete);
    on<HomeDeleteAllEvent>(_onDeleteAll);
  }

  void _onInit(
    HomeInitEvent event,
    Emitter<HomeState> emit,
  ) async {
    final tasks = await dbTask.getListTask();
    emit(state.copyWith(
      listTask: tasks,
    ));
  }

  void _onInsert(
    HomeInsertEvent event,
    Emitter<HomeState> emit,
  ) async {
    await dbTask.insertTask(event.taskModel);
    final tasks = await dbTask.getListTask();
    emit(state.copyWith(
      listTask: tasks,
    ));
  }

  void _onDelete(
    HomeDeleteEvent event,
    Emitter<HomeState> emit,
  ) async {
    await dbTask.deleteTask(event.id);
    final tasks = await dbTask.getListTask();
    emit(state.copyWith(
      listTask: tasks,
    ));
  }

  void _onDeleteAll(
    HomeDeleteAllEvent event,
    Emitter<HomeState> emit,
  ) async {
    await dbTask.deleteAllTask();
    emit(state.copyWith(
      listTask: [],
    ));
  }
}
