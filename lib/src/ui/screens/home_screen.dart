import 'package:flutter/material.dart';
import 'package:flutter_note/src/core/data/constants.dart';
import 'package:flutter_note/src/ui/widgets/dialog_content_note.dart';
import 'package:flutter_note/src/ui/widgets/dialog_delete_all.dart';
import 'package:flutter_note/src/ui/widgets/dialog_menu.dart';
import 'package:flutter_note/src/ui/widgets/item_note.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "home-screen";
  const HomeScreen({super.key});

  void _showInsertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(dialogRadius),
          ),
          content: const DialogContentNote(title: "Insert New Task"),
        );
      },
    );
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
