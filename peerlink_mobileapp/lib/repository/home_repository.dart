import 'package:peerlink_mobileapp/data/network/network_api_services.dart';
import 'package:peerlink_mobileapp/res/app_url/app_url.dart';

class HomeRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> fetchChats() {
    final response = _apiService.getApi(AppUrl.fetchChats);

    return response;
  }
}
