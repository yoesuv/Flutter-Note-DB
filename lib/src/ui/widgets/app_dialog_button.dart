import 'package:flutter/material.dart';

class AppDialogButton extends StatelessWidget {
  const AppDialogButton({
    super.key,
    this.onPressed,
    this.label,
  });

  final Function()? onPressed;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label ?? "",
        style: const TextStyle(
          color: Colors.pink,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
