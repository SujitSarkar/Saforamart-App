import 'package:flutter/material.dart';

class TextFieldEdit extends StatelessWidget {
  const TextFieldEdit({Key? key, required this.text, required this.controller})
      : super(key: key);

  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: const UnderlineInputBorder(),
          labelText: text,
          suffixIcon: const Icon(Icons.edit)),
    );
  }
}
