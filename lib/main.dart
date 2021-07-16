import 'package:flutter/material.dart';
import 'sign_in_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: null,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.red.shade400,
                Colors.purple.shade300,
              ],
            )),
            child: Center(
              child: const SignInCard()
            ),
          ),
        ),
      ),
    );
  }
}
