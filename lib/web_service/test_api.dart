import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:test_project/model/sign_in_response.dart';

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
        _apiResponse.result = responseBody['result']['access'];
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

/*
Future<Album> fetchApiData() async {
  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}*/