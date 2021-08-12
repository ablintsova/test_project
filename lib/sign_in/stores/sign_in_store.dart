import 'package:mobx/mobx.dart';
import 'package:test_project/helpers/storage.dart';
import 'package:test_project/model/sign_in_response.dart';
import 'package:test_project/res/app_strings.dart';
import 'package:test_project/web_service/test_api.dart';

part 'sign_in_store.g.dart';

class SignInStore = _SignInStore with _$SignInStore;

SignInStore _singleton = SignInStore();

SignInStore get getSignInStore => _singleton;

abstract class _SignInStore with Store {
  @observable
  late SignInResponse response;

  @observable
  bool isLoading = false;

  @observable
  String error = "";

  @action
  Future signIn() async {
    isLoading = true;
    try {
      final response = await TestApi().signIn();
      if (response.error.isEmpty && response.token.isNotEmpty) {
        Storage.writeTokenToStorage(response.token);
      }
    } on Error {
      error = response.error;
      response.error = AppStrings.server_error;
    }
    isLoading = false;
  }
}
