import 'package:flutter/cupertino.dart';
import 'package:flutter_note/src/ui/widgets/app_dialog_button.dart';
import 'package:flutter_note/src/ui/widgets/dialog_title.dart';

class DialogMenu extends StatelessWidget {
  const DialogMenu({super.key, this.title, this.onEdit, this.onDelete});

  final String? title;
  final Function()? onEdit;
  final Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DialogTitle(title: title),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: AppDialogButton(label: "Edit", onPressed: onEdit),
        ),
        SizedBox(
          width: double.infinity,
          child: AppDialogButton(label: "Delete", onPressed: onDelete),
        ),
      ],
    );
  }
}
