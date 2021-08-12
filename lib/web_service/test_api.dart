import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:test_project/model/feed_response.dart';
import 'package:test_project/model/sign_in_response.dart';
import 'package:test_project/res/app_strings.dart';

class TestApi {
  static String BASE_URL = 'https://app.ferfit.club/api';

  Future<SignInResponse> signIn() async {
    SignInResponse _apiResponse = new SignInResponse();

    try {
      final response = await http.post(
        Uri.parse('$BASE_URL/auth/refresh-tokens'),
        headers: <String, String>{
          HttpHeaders.authorizationHeader:
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTksImlhdCI6MTYyMDQ5MTYxNCwiZXhwIjoxMDAxNjIwNDkxNjE0fQ.zGqmT0dH2bUMkG5DltUciML5CCXDbXsdO3p5a6AH5Z8'
        },
      );
      final responseBody = json.decode(response.body);
      switch (response.statusCode) {
        case 200:
          _apiResponse.token = responseBody['result']['access'];
          break;
        default:
          _apiResponse.error = responseBody['msg'];
          break;
      }
    } on SocketException {
      _apiResponse.error = AppStrings.server_error;
    }
    return _apiResponse;
  }

  Future<FeedResponse> getFeed(String token) async {
    FeedResponse _apiResponse = new FeedResponse();
    _apiResponse.posts = [];

    try {
      final response = await http.get(
        Uri.parse(
            '$BASE_URL/feed?limit=10&offset=0&maxDate=2021-07-06T18:26:42.820994'),
        headers: <String, String>{
          HttpHeaders.authorizationHeader: 'Bearer $token'
        },
      );
      final responseBody = json.decode(response.body);
      switch (response.statusCode) {
        case 200:
          List<dynamic> list = responseBody['result']['posts'];
          list.forEach((element) {
            _apiResponse.posts!.add(Post.fromJson(element));
          });
          break;
        default:
          _apiResponse.error = responseBody['msg'];
          break;
      }
    } on SocketException {
      _apiResponse.error = AppStrings.server_error;
    }
    return _apiResponse;
  }
}
