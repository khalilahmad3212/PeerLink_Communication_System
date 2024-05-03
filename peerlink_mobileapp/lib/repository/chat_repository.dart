import 'package:peerlink_mobileapp/data/network/network_api_services.dart';
import 'package:peerlink_mobileapp/res/app_url/app_url.dart';

class ChatRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> fetchMessages(String chatId) {
    final response = _apiService.getApi(AppUrl.fetchMessages(chatId));

    return response;
  }

  Future<dynamic> sendMessage(String chatId, dynamic message) {
    final response = _apiService.postApi(message, AppUrl.sendMessage(chatId));

    return response;
  }
}
