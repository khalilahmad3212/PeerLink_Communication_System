import 'package:peerlink_mobileapp/data/network/network_api_services.dart';
import 'package:peerlink_mobileapp/res/app_url/app_url.dart';

class SearchUsersRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> fetchUsers() {
    final response = _apiService.getApi(AppUrl.fetchUsers);

    return response;
  }

  Future<dynamic> createChat(String receiverId) {
    final response = _apiService.postApi({}, AppUrl.createChat(receiverId));

    return response;
  }

  Future<dynamic> createGroupChat(var data) {
    final response = _apiService.postApiEncoded(data, AppUrl.createGroupChat);

    return response;
  }
}
