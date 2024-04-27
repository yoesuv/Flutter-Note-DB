import 'package:flutter/material.dart';
import 'package:flutter_note/src/ui/widgets/app_dialog_button.dart';
import 'package:flutter_note/src/ui/widgets/dialog_title.dart';

class DialogDeleteAll extends StatelessWidget {
  const DialogDeleteAll({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DialogTitle(title: title),
        const SizedBox(height: 16),
        const Text(
          "Delete All Task?",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: AppDialogButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                label: "Cancel",
              ),
            ),
            Expanded(
              child: AppDialogButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                label: "Yes",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
