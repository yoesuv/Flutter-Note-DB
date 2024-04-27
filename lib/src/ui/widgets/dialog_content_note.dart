import 'package:flutter/material.dart';
import 'package:flutter_note/src/core/models/task_model.dart';
import 'package:flutter_note/src/ui/widgets/app_dialog_button.dart';
import 'package:flutter_note/src/ui/widgets/app_textfield.dart';
import 'package:flutter_note/src/ui/widgets/dialog_title.dart';

class DialogContentNote extends StatelessWidget {
  DialogContentNote({
    super.key,
    this.title,
  });

  final String? title;

  final _controllerTitle = TextEditingController();
  final _controllerContent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DialogTitle(title: title),
        const SizedBox(height: 16),
        AppTextField(
          labelText: "Task Title",
          controller: _controllerTitle,
        ),
        const SizedBox(height: 8),
        AppTextField(
          labelText: "Task Content",
          controller: _controllerContent,
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
                  final data = TaskModel(
                    title: _controllerTitle.text,
                    content: _controllerContent.text,
                  );
                  Navigator.pop(context, data);
                },
                label: "Save",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
