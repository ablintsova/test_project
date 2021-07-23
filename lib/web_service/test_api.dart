import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:test_project/model/sign_in_response.dart';
import 'package:test_project/model/feed_response.dart';

Future<SignInResponse> signIn() async {
  SignInResponse _apiResponse = new SignInResponse();

  try {
    final response = await http.post(
      Uri.parse('https://app.ferfit.club/api/auth/refresh-tokens'),
      headers: <String, String> {
        HttpHeaders.authorizationHeader: 'token'
      },
    );
    final responseBody = json.decode(response.body);
    switch (response.statusCode) {
      case 200:
        _apiResponse.token = responseBody['result']['access'];
        break;
      case 401:
        _apiResponse.error = responseBody['msg'];
        break;
      default:
        _apiResponse.error = responseBody['msg'];
        break;
    }
  } on SocketException {
    _apiResponse.error = "Server error. Please retry";
  }
  return _apiResponse;
}

Future<FeedResponse> getFeed(String token) async {
  FeedResponse _apiResponse = new FeedResponse();
  _apiResponse.posts = [];

  try {
    final response = await http.get(
        Uri.parse(
            'https://app.ferfit.club/api/feed?limit=10&offset=0&maxDate=2021-07-06T18:26:42.820994'),
        headers: <String, String>{
          HttpHeaders.authorizationHeader: 'Bearer $token'
        });
    final responseBody = json.decode(response.body);
    switch (response.statusCode) {
      case 200:
        List<dynamic> list = responseBody['result']['posts'];
        list.forEach((element) {
          _apiResponse.posts!.add(Post.fromJson(element));
        });
        break;
      case 401:
        _apiResponse.error = responseBody['msg'];
        break;
      default:
        _apiResponse.error = responseBody['msg'];
        break;
    }
  } on SocketException {
    _apiResponse.error = "Server error. Please retry";
  }

  return _apiResponse;
}
