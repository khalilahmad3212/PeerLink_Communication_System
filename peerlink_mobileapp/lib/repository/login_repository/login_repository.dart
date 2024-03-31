import 'package:flutter/widgets.dart';
import 'package:peerlink_mobileapp/data/network/network_api_services.dart';
import 'package:peerlink_mobileapp/res/app_url/app_url.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> loginApi(var data) {
    dynamic response = _apiService.postApi(data, AppUrl.loginApi);
    return response;
  }
}
