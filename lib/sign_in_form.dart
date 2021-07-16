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
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Nickname',
              labelStyle: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              //border: UnderlineInputBorder(),
              suffixIcon: Icon(Icons.remove_red_eye_outlined,
                  color: Colors.red.shade400),
              labelText: 'Password',
              labelStyle: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, elevation: 0),
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
                      const BoxConstraints(minWidth: 88.0, minHeight: 48.0),
                  // min sizes for Material buttons
                  alignment: Alignment.center,
                  child: const Text(
                    'Sign In',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 6.0),
            child: Text('Регистрируясь, вы принимаете наши условия:',
                style: TextStyle(
                  fontSize: 12.0)
                )
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text('политику использования данных', style: TextStyle(
                fontSize: 12.0,
                decoration: TextDecoration.underline,
                color: Colors.blue
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child:
                Text('политику в отношении файлов cookie', style: TextStyle(
                    fontSize: 12.0,
                    decoration: TextDecoration.underline,
                    color: Colors.blue
                )),
          )
        ],
      ),
    );
  }
}
