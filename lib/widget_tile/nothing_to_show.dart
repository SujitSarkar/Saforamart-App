import 'package:flutter/material.dart';

class NothingToShow extends StatelessWidget {
  const NothingToShow({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
