import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.labelText,
    this.onChanged,
    this.textInputAction,
  });

  final TextEditingController? controller;
  final String? labelText;
  final Function(String)? onChanged;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14),
      ),
      textInputAction: textInputAction ?? TextInputAction.done,
      keyboardType: TextInputType.text,
      onChanged: onChanged,
    );
  }
}
