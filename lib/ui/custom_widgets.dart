import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:test_project/helpers/utils.dart';
import 'package:test_project/helpers/validators.dart';
import 'package:test_project/res/app_colors.dart';
import 'package:test_project/res/app_strings.dart';
import 'package:test_project/sign_in/stores/sign_in_store.dart';

class SimpleLabel extends StatelessWidget {
  final EdgeInsets padding;
  final String text;

  SimpleLabel({required this.text, required this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: TextStyle(fontSize: 14.0, color: Colors.grey),
      ),
    );
  }
}

class LinkLabel extends StatelessWidget {
  final EdgeInsets padding;
  final String text;

  LinkLabel({required this.text, required this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(text,
          style: TextStyle(
              fontSize: 12.0,
              decoration: TextDecoration.underline,
              color: Colors.blue)),
    );
  }
}

class SignInButton extends StatelessWidget {

  final SignIn signIn;

  SignInButton(this.signIn);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        elevation: 0,
      ),
      onPressed: signIn,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.red.shade400,
              Colors.purple.shade300,
            ],
          ),
        ),
        child: Container(
          constraints: const BoxConstraints(minWidth: 88.0, minHeight: 56.0),
          alignment: Alignment.center,
          child: Text(
            AppStrings.sign_in,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}

class NicknameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => Validator.nickname(value),
    );
  }
}

class PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          isDense: true,
          suffixIcon: GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(top: 4),
              child: Icon(Icons.remove_red_eye_outlined,
                  color: Colors.red.shade400),
            ),
          ),
          suffixIconConstraints: BoxConstraints(
            minHeight: 32,
            minWidth: 32,
          ),
        ),
        obscureText: true,
        obscuringCharacter: "*",
        enableSuggestions: false,
        autocorrect: false,
        validator: (value) => Validator.password(value),
    );
  }
}

class PostCard extends StatelessWidget {
  final String text;

  PostCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: Colors.white,
      child: Column(children: <Widget>[
        ListTile(
          leading: RoundIcon(),
          title: Text(
            AppStrings.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          title: Text(text),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              Icon(
                Icons.favorite,
                color: AppColors.red,
                size: 24.0,
                semanticLabel: 'Like',
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                '88',
                style: TextStyle(
                  color: AppColors.red,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Icon(
                Icons.chat_bubble_outlined,
                color: AppColors.grey,
                size: 24.0,
                semanticLabel: 'Comments',
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                '12',
                style: TextStyle(
                  color: AppColors.grey,
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

class RoundIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Ink(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.red.shade400,
              Colors.purple.shade300,
            ],
          ),
        ),
        child: Container(
          constraints: const BoxConstraints.tightFor(width: 38.0, height: 38.0),
          alignment: Alignment.center,
          child: Image(
              image: AssetImage('assets/images/photo.png'),
              width: 35.0,
              height: 35.0),
        ),
      ),
    );
  }
}
