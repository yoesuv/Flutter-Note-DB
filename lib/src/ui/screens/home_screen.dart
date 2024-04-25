import 'package:flutter/material.dart';
import 'package:flutter_note/src/ui/widgets/item_note.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Task"),
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
        onPressed: () {},
        child: Icon(Icons.add_circle_outline_rounded),
      ),
    );
  }
}
