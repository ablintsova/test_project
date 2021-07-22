import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {
  BlankPage(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Text(title),
    );
  }
}