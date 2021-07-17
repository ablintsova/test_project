import 'package:flutter/material.dart';

// Create a Form widget.
class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class SignInFormState extends State<SignInForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                  'Nickname',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey
                  )
              )
          ),
          TextFormField(
            // The validator receives the text that the user has entered.
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
              child: Text(
                  'Password',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey
                  )
              )
          ),
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
            // The validator receives the text that the user has entered.
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
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
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
                  child: const Text(
                      'Sign In',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0)
                  ),
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
}
