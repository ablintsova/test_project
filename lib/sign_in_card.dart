import 'package:flutter/material.dart';

import 'sign_in_form.dart';

class SignInCard extends StatelessWidget {
  const SignInCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
            child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[SignInForm()])))));
  }
}
