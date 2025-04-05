import 'package:flutter/material.dart';
import 'package:flutter_note/src/core/data/constants.dart';

class DialogTitle extends StatelessWidget {
  const DialogTitle({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(dialogRadius),
          topRight: Radius.circular(dialogRadius),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Center(
        child: Text(
          title ?? "Insert New Task",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
