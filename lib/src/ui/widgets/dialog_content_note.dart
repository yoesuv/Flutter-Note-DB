import 'package:flutter/material.dart';
import 'package:flutter_note/src/core/data/constants.dart';
import 'package:flutter_note/src/ui/widgets/app_textfield.dart';

class DialogContentNote extends StatelessWidget {
  const DialogContentNote({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTitle(title: title),
        const SizedBox(height: 16),
        AppTextField(labelText: "Task Title"),
        const SizedBox(height: 8),
        AppTextField(labelText: "Task Content"),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                label: "Cancel",
              ),
            ),
            Expanded(
              child: _buildButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                label: "Save",
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTitle({String? title}) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(dialogRadius),
          topRight: Radius.circular(dialogRadius),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
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

  Widget _buildButton({
    Function()? onPressed,
    String? label,
  }) {
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
