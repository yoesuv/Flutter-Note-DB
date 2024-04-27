import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note/src/core/events/home_event.dart';
import 'package:flutter_note/src/core/states/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeInitEvent>(_onInit);
    on<HomeInsertEvent>(_onInsert);
  }

  void _onInit(
    HomeInitEvent event,
    Emitter<HomeState> emit,
  ) {}

  void _onInsert(
    HomeInsertEvent event,
    Emitter<HomeState> emit,
  ) {}
}
