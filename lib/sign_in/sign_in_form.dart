import 'package:flutter/material.dart';
import 'package:test_project/model/sign_in_response.dart';
import 'package:test_project/web_service/test_api.dart' as api;

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
              child: Text('Nickname',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey))),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Введите имя пользователя';
              } else {
                final alphanumeric = RegExp(r'[a-zA-Z_]+');
                if (!alphanumeric.hasMatch(value) ||
                    (alphanumeric.hasMatch(value) &&
                        alphanumeric.stringMatch(value) != value)) {
                  return 'Разрешены символы латинского алфавита или “_”';
                }
                return null;
              }
            },
          ),
          Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Text('Password',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey))),
          TextFormField(
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
                return 'Введите пароль';
              } else if (value.length < 3 || value.length > 9) {
                return 'Пароль должен содержать от 3 до 9 символов';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  elevation: 0),
              onPressed: _signIn,
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
                  // min sizes for Material buttons
                  alignment: Alignment.center,
                  child: const Text('Sign In',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0)),
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Text('Регистрируясь, вы принимаете наши условия:',
                  style: TextStyle(fontSize: 12.0))),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text('политику использования данных',
                style: TextStyle(
                    fontSize: 12.0,
                    decoration: TextDecoration.underline,
                    color: Colors.blue)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text('политику в отношении файлов cookie',
                style: TextStyle(
                    fontSize: 12.0,
                    decoration: TextDecoration.underline,
                    color: Colors.blue)),
          )
        ],
      ),
    );
  }

  void _signIn() async {
    if (_formKey.currentState!.validate()) {
      SignInResponse apiResponse = await api.signIn();
      if (apiResponse.error.isEmpty) {
        _saveAndRedirectToNews();
      } else {
        final snackBar = SnackBar(
          content: Text(apiResponse.error),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //showInSnackBar((_apiResponse.ApiError as ApiError).error);
      }
    } else {
      final snackBar = SnackBar(
        content: Text("Проверьте корректность введённых данных"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  void _saveAndRedirectToNews() {
   // SharedPreferences prefs = await SharedPreferences.getInstance();
    //await prefs.setString("userId", (_apiResponse.Data as User).userId);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => NavigationPage(),
            fullscreenDialog: true));
  }
}
