import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_note/src/core/blocs/home_bloc.dart';
import 'package:flutter_note/src/core/data/constants.dart';
import 'package:flutter_note/src/core/events/home_event.dart';
import 'package:flutter_note/src/core/models/task_model.dart';
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

  void _showDeleteAllDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(dialogRadius),
          ),
          content: const DialogDeleteAll(title: "Delete All"),
        );
      },
    );
  }

  void _showMenuDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(dialogRadius),
          ),
          content: DialogMenu(
            title: "Menu",
            onEdit: () {
              Navigator.pop(context);
            },
            onDelete: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
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
      appBar: AppBar(
        title: const Text("My Task"),
        actions: [
          IconButton(
            onPressed: () {
              _showDeleteAllDialog(context);
            },
            icon: const Icon(
              Icons.delete_forever_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ItemNote(
              onTapMenu: () {
                _showMenuDialog(context);
              },
            );
          },
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemCount: 9,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showInsertDialog(context);
        },
        child: const Icon(
          Icons.add_circle_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
