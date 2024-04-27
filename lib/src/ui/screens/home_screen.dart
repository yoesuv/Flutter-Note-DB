import 'package:flutter/material.dart';
import 'package:flutter_note/src/core/data/constants.dart';
import 'package:flutter_note/src/ui/widgets/dialog_content_note.dart';
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
          content: DialogContentNote(),
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
            onPressed: () {},
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
            return ItemNote();
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
          Icons.add_circle_outline_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
