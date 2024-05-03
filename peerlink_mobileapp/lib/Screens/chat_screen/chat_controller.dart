import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peerlink_mobileapp/repository/chat_repository.dart';
import 'package:peerlink_mobileapp/user_preference/user_preference_controller.dart';
import 'package:peerlink_mobileapp/utils/utils.dart';

class ChatController extends GetxController {
  RxBool loading = false.obs;
  dynamic chatMessages;
  RxBool isGroupChat = false.obs;
  final messageController = TextEditingController();
  // RxInt chatCount = 0.obs;
  String? myId;

  final _api = ChatRepository();

  UserPreference userPreference = UserPreference();

  void updateUI() {
    update();
  }

  Future<void> getMyId() async {
    await userPreference.getUser().then(
      (value) {
        myId = value.user!.id;
      },
    );
  }

  void fetchMessages(String chatId) {
    loading.value = true;

    _api.fetchMessages(chatId).then(
      (value) {
        loading.value = false;
        chatMessages = value['data'];
        print('<======My Chat======>\n$value');
      },
    ).onError(
      (error, stackTrace) {
        loading.value = false;
        print(error.toString());
        Utils.snakBar('Error', error.toString());
        Utils.toastMessage(error.toString());
      },
    );
  }

  void sendMessage(String chatId, String message) {
    loading.value = true;

    dynamic body = {
      'content': message,
    };

    _api.sendMessage(chatId, body).then(
      (value) {
        loading.value = false;
        print('<======My Chat======>\n$value');
        // chatMessages.add(value['data']);
        chatMessages.insert(0, value['data']);
      },
    ).onError(
      (error, stackTrace) {
        loading.value = false;
        print(error.toString());
        Utils.snakBar('Error', error.toString());
        Utils.toastMessage(error.toString());
      },
    );
  }
}
