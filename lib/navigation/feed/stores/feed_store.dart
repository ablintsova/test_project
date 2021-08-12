import 'package:mobx/mobx.dart';
import 'package:test_project/helpers/storage.dart';
import 'package:test_project/model/feed_response.dart';
import 'package:test_project/web_service/test_api.dart';

part 'feed_store.g.dart';

class FeedStore = _FeedStore with _$FeedStore;

FeedStore _singleton = FeedStore();

FeedStore get getFeedStore => _singleton;

abstract class _FeedStore with Store {
  @observable
  FeedResponse? response;

  @observable
  String error = "";

  @observable
  bool isLoading = false;

  @action
  Future getFeed() async {
    isLoading = true;
    try {
      final String? token = await Storage.readFromSecureStorage();
      print('getFeed - got token: $token');
      if (token != null) {
        print('trying to get feed');
        response = await TestApi().getFeed(token);
      }
    } on Error {
      error = response!.error;
    }
    isLoading = false;
  }
}

