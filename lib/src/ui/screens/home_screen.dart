import 'package:flutter/material.dart';

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
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
              ),
              child: Text("Item $index"),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
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
