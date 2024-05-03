import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:peerlink_mobileapp/data/app_exceptions.dart';
import 'package:peerlink_mobileapp/data/network/base_api_services.dart';
import 'package:peerlink_mobileapp/user_preference/user_preference_controller.dart';

class NetworkApiServices extends BaseApiServices {
  UserPreference userPreference = UserPreference();
  var token;

  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    // dynamic user = userPreference.getUser();
    await userPreference.getUser().then(
      (value) {
        token = value.accessToken;
      },
    );
    if (token == null) {
      print('Token is null');
    } else {
      print('Token is not null $token');
    }
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Access-Control-Allow-Credentials': 'true',
          'Access-Control-Allow-Origin': 'http://localhost:8080',
          'Connection': 'keep-alive',
          'Keep-Alive': 'timeout=5',
        },
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOutException {
      throw RequestTimeOutException('');
    }

    return responseJson;
  }

  @override
  Future<dynamic> postApi(dynamic data, String url) async {
    dynamic responseJson;

    print('inside postApi: $data $url');

    try {
      // if raw data then encode otherwise if form data then do no encode
      print('inside try block');
      final response = await http.post(
        Uri.parse(url),
        body: data,
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Access-Control-Allow-Credentials': 'true',
          'Access-Control-Allow-Origin': 'http://localhost:8080',
          'Connection': 'keep-alive',
          'Keep-Alive': 'timeout=5',
        },
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
      print('finished postApi $responseJson');
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOutException {
      throw RequestTimeOutException('');
    }

    return responseJson;
  }

  @override
  Future<dynamic> postApiEncoded(Map<String, dynamic> data, String url) async {
    dynamic responseJson;

    print('inside postApi: $data $url');

    try {
      // if raw data then encode otherwise if form data then do no encode
      print('inside try block');
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
          'Access-Control-Allow-Credentials': 'true',
          'Access-Control-Allow-Origin': 'http://localhost:8080',
          'Connection': 'keep-alive',
          'Keep-Alive': 'timeout=5',
        },
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
      print('finished postApi $responseJson');
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOutException {
      throw RequestTimeOutException('');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataException(
            'Error occured while communicating with server ${response.statusCode}');
    }
  }
}
