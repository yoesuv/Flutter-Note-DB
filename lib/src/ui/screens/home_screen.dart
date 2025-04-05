import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note/src/core/blocs/home_bloc.dart';
import 'package:flutter_note/src/core/data/constants.dart';
import 'package:flutter_note/src/core/events/home_event.dart';
import 'package:flutter_note/src/core/models/task_model.dart';
import 'package:flutter_note/src/core/states/home_state.dart';
import 'package:flutter_note/src/ui/widgets/dialog_content_note.dart';
import 'package:flutter_note/src/ui/widgets/dialog_delete_all.dart';
import 'package:flutter_note/src/ui/widgets/dialog_menu.dart';
import 'package:flutter_note/src/ui/widgets/item_note.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "home-screen";

  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc? _bloc;

  void _showInsertDialog(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(dialogRadius),
          ),
          content: DialogContentNote(title: "Insert New Task"),
        );
      },
    );
    if (result != null) {
      final data = result as TaskModel;
      _bloc?.add(HomeInsertEvent(taskModel: data));
    }
  }

  void _showDeleteAllDialog(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(dialogRadius),
          ),
          content: const DialogDeleteAll(title: "Delete All"),
        );
      },
    );
    if (result != null) {
      final data = result as bool;
      if (data) {
        _bloc?.add(HomeDeleteAllEvent());
      }
    }
  }

  void _showMenuDialog(BuildContext context, TaskModel task) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(dialogRadius),
          ),
          content: DialogMenu(
            title: "Menu",
            onEdit: () {
              Navigator.pop(context);
              _showEditDialog(context, taskModel: task);
            },
            onDelete: () {
              Navigator.pop(context);
              _bloc?.add(HomeDeleteEvent(id: task.id ?? 0));
            },
          ),
        );
      },
    );
  }

  void _showEditDialog(BuildContext context, {TaskModel? taskModel}) async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(dialogRadius),
          ),
          content: DialogContentNote(
            title: "Update Task",
            taskModel: taskModel,
          ),
        );
      },
    );
    if (result != null) {
      final data = result as TaskModel;
      _bloc?.add(HomeUpdateEvent(taskModel: data));
    }
  }

  @override
  void initState() {
    super.initState();
    _bloc = context.read<HomeBloc>();
    _bloc?.add(HomeInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My Task", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              _showDeleteAllDialog(context);
            },
            icon: const Icon(Icons.delete_forever_rounded, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          bloc: _bloc,
          buildWhen:
              (previous, current) =>
                  previous.listTask != current.listTask ||
                  previous.listTask.length != current.listTask.length,
          builder: (context, state) {
            if (state.listTask.isEmpty) {
              return _emptyTask();
            }
            return ListView.separated(
              itemBuilder: (context, index) {
                final task = state.listTask[index];
                return ItemNote(
                  taskModel: task,
                  onTapMenu: () {
                    _showMenuDialog(context, task);
                  },
                );
              },
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemCount: state.listTask.length,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showInsertDialog(context);
        },
        child: const Icon(Icons.add_circle_rounded, color: Colors.white),
      ),
    );
  }

  Widget _emptyTask() {
    return const Center(
      child: Text(
        "Task is Empty",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}
