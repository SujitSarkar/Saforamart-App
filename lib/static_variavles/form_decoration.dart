import 'package:flutter/material.dart';

class FormDecoration {
  static InputDecoration formDecoration(double size, String hintText) =>
      InputDecoration(
        // hintText: hintText,
        labelText: hintText,
        hintStyle: TextStyle(color: Colors.grey, fontSize: size * .04),
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
      );

  
}
