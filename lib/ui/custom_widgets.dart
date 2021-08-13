import 'package:flutter/material.dart';
import 'package:test_project/helpers/utils.dart';
import 'package:test_project/helpers/validators.dart';
import 'package:test_project/res/app_colors.dart';
import 'package:test_project/res/app_strings.dart';

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
            child:
                Icon(Icons.remove_red_eye_outlined, color: Colors.red.shade400),
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
    return Stack(
      alignment: const Alignment(-1.0, -1.0),
      children: <Widget>[
        Card(
          elevation: 2.0,
          color: Colors.white,
          child: Column(children: <Widget>[
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
                SizedBox(
                  width: 40.0,
                ),
                Text(
                  AppStrings.name,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            ListTile(
              title: Text(
                text,
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
                SizedBox(
                  width: 16.0,
                ),
                Icon(
                  Icons.favorite,
                  color: AppColors.red,
                  size: 16.0,
                  semanticLabel: 'Like',
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  '88',
                  style: TextStyle(
                    color: AppColors.red,
                  ),
                ),
                const SizedBox(
                  width: 24.0,
                ),
                Icon(
                  Icons.chat_bubble_outlined,
                  color: AppColors.grey,
                  size: 16.0,
                  semanticLabel: 'Comments',
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  '12',
                  style: TextStyle(
                    color: AppColors.grey,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
          ]),
        ),
        RoundIcon(),
      ],
    );
  }
}

class RoundIcon extends StatelessWidget {
  RoundIcon();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.1, 0.1),
      children: <Widget>[
        SizedBox(
          width: 32.0,
          height: 32.0,
          child: Container(
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
          ),
        ),
        Image(
            image: AssetImage('assets/images/photo.png'),
            width: 28.0,
            height: 28.0),
      ],
    );
  }
}
