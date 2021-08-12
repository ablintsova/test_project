import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:test_project/navigation/navigation.dart';
import 'package:test_project/res/app_strings.dart';
import 'package:test_project/sign_in/stores/sign_in_store.dart';
import 'package:test_project/ui/custom_widgets.dart';

class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}

class SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  void signIn() async {
    if (_formKey.currentState!.validate()) {
      await getSignInStore.signIn();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Navigation(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Observer(
        builder: (_) {
          if (SignInStore().isLoading) return CircularProgressIndicator();

          if (SignInStore().error != "") return Text("ERROR");

          return buildForm();
        },
      ),
    );
  }

  Widget buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SimpleLabel(
          text: AppStrings.nickname,
          padding: const EdgeInsets.only(top: 16.0),
        ),
        NicknameField(),
        SimpleLabel(
          text: AppStrings.password,
          padding: const EdgeInsets.only(top: 32.0),
        ),
        PasswordField(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: SignInButton(signIn),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Text(
            AppStrings.by_registering,
            style: TextStyle(fontSize: 12.0),
          ),
        ),
        LinkLabel(
          text: AppStrings.data_policy,
          padding: const EdgeInsets.symmetric(vertical: 4.0),
        ),
        LinkLabel(
          text: AppStrings.cookie_policy,
          padding: const EdgeInsets.only(bottom: 8.0),
        )
      ],
    );
  }
}
