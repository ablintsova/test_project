import 'package:flutter/material.dart';
import 'package:test_project/sign_in/sign_in_card.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32.0),
              bottomRight: Radius.circular(32.0),
              topRight: Radius.circular(4.0),
              bottomLeft: Radius.circular(4.0),
            ),
          ),
        ),
        appBarTheme: AppBarTheme(color: Colors.transparent),
      ),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
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
              ),
            ),
            child: Center(
              child: SignInCard(),
            ),
          ),
        ),
      ),
    );
  }
}
