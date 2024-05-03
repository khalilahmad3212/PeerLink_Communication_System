// import 'package:get/get.dart';
// import 'package:peerlink_mobileapp/repository/login_repository/home_repository.dart';
// import 'package:peerlink_mobileapp/utils/utils.dart';

// class HomeController extends GetxController {
//   final _api = HomeRepository();

//   RxBool loading = false.obs;
//   dynamic chatList;
//   RxInt chatCount = 0.obs;

//   void fetchChats() {
//     loading.value = true;

//     _api.fetchChats().then(
//       (value) {
//         loading.value = false;
//         chatList = value['data'];
//         chatCount.value = chatList.length;
//         print(chatList);
//       },
//     ).onError(
//       (error, stackTrace) {
//         loading.value = false;
//         print(error.toString());
//         Utils.snakBar('Error', error.toString());
//         Utils.toastMessage(error.toString());
//       },
//     );
//   }
// }

import 'package:get/get.dart';
import 'package:peerlink_mobileapp/repository/home_repository.dart';
import 'package:peerlink_mobileapp/services/socket_io_services.dart';
import 'package:peerlink_mobileapp/user_preference/user_preference_controller.dart';
import 'package:peerlink_mobileapp/utils/utils.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();
  final SocketIOService _socketService = Get.put(SocketIOService());
  final UserPreference userPreference = UserPreference();

  RxBool loading = false.obs;
  RxList<dynamic> chatList = [].obs;
  String myUsername = '';
  RxBool isChatTab = true.obs;

  @override
  void onInit() async {
    super.onInit();
    // Listen for incoming chat updates from the socket connection
    _listenForChatUpdates();
    myUsername = await getMyUsername();
  }

  void toggleFloatingButton() {
    isChatTab.value = !isChatTab.value;
  }

  Future<String> getMyUsername() async {
    String username = '';
    await userPreference.getUser().then(
      (value) {
        username = value.user!.username!;
      },
    );
    return username;
  }

  void fetchChats() {
    loading.value = true;

    _api.fetchChats().then(
      (value) {
        loading.value = false;
        chatList.assignAll(value['data']);
        print(chatList);
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

  // Method to listen for incoming chat updates from the socket connection
  void _listenForChatUpdates() {
    _socketService.socket?.on('chatUpdate', (data) {
      // Update the chat list with the new data received
      chatList.assignAll(data['chats']);
    });
  }
}
