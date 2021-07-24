import 'package:flutter/material.dart';
import 'package:test_project/model/sign_in_response.dart';
import 'package:test_project/res/app_strings.dart';
import 'package:test_project/web_service/test_api.dart' as api;
import 'package:shared_preferences/shared_preferences.dart';
import '../navigation/navigation.dart';

class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}

class SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(AppStrings.nickname,
                  style: TextStyle(fontSize: 14.0, color: Colors.grey))),
          buildNicknameField(),
          Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Text(AppStrings.password,
                  style: TextStyle(fontSize: 14.0, color: Colors.grey))),
          buildPasswordField(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: buildSignInButton()
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Text(AppStrings.by_registering,
                  style: TextStyle(fontSize: 12.0))),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(AppStrings.data_policy,
                style: TextStyle(
                    fontSize: 12.0,
                    decoration: TextDecoration.underline,
                    color: Colors.blue)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(AppStrings.cookie_policy,
                style: TextStyle(
                    fontSize: 12.0,
                    decoration: TextDecoration.underline,
                    color: Colors.blue)),
          )
        ],
      ),
    );
  }

  Widget buildNicknameField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.msg_enter_nickname;
        } else {
          final alphanumeric = RegExp(r'[a-zA-Z_]+');
          if (!alphanumeric.hasMatch(value) ||
              (alphanumeric.hasMatch(value) &&
                  alphanumeric.stringMatch(value) != value)) {
            return AppStrings.msg_invalid_nickname;
          }
          return null;
        }
      },
    );
  }

  Widget buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        suffixIcon: new GestureDetector(
          onTap: () {},
          child: new Container(
            margin: EdgeInsets.only(top: 4),
            child: Icon(Icons.remove_red_eye_outlined,
                color: Colors.red.shade400),
            //height: 20,
            //width: 20,
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.msg_enter_password;
        } else if (value.length < 3 || value.length > 9) {
          return AppStrings.msg_invalid_password;
        }
        return null;
      },
    );
  }

  Widget buildSignInButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)),
          elevation: 0),
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
          constraints:
          const BoxConstraints(minWidth: 88.0, minHeight: 56.0),
          alignment: Alignment.center,
          child: const Text(AppStrings.sign_in,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0)),
        ),
      ),
    );
  }

  void signIn() async {
    if (_formKey.currentState!.validate()) {
      SignInResponse apiResponse = await api.signIn();
      if (apiResponse.error.isEmpty) {
        saveAndRedirectToNews(apiResponse.token);
      } else {
        showSnackBar(apiResponse.error);
      }
    } else {
      showSnackBar(AppStrings.msg_invalid_data);
    }
  }
  void saveAndRedirectToNews(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => NavigationPage(),
            fullscreenDialog: true));
  }

  void showSnackBar(String text) {
    final snackBar = SnackBar(
      content: Text(text),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
