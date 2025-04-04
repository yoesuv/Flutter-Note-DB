import 'package:flutter/material.dart';
import 'package:flutter_note/src/core/models/task_model.dart';

class ItemNote extends StatelessWidget {
  const ItemNote({super.key, required this.taskModel, this.onTapMenu});

  final TaskModel taskModel;
  final Function()? onTapMenu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 14),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_title(), _content()],
            ),
          ),
          IconButton(
            onPressed: onTapMenu,
            icon: const Icon(Icons.more_vert, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return Text(
      taskModel.title ?? "",
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _content() {
    return Text(
      taskModel.content ?? "",
      style: const TextStyle(
        color: Colors.black87,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
