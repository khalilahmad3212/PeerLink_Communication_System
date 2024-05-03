import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:peerlink_mobileapp/repository/search_users_repository.dart';
import 'package:peerlink_mobileapp/user_preference/user_preference_controller.dart';
import 'package:peerlink_mobileapp/utils/utils.dart';

class SearchUserController extends GetxController {
  final usernameController = TextEditingController();
  final usernameFocusNode = FocusNode();
  final groupname = TextEditingController();
  final _api = SearchUsersRepository();
  final UserPreference userPreference = UserPreference();

  RxList<dynamic> userList = [].obs;
  RxList<dynamic> filteredList = <dynamic>[].obs;
  String myUsername = '';
  String myUserId = '';
  String selectedChatId = '';
  String selectedGroupId = '';

  @override
  void onInit() async {
    super.onInit();
    usernameFocusNode.requestFocus();
    fetchUsersApi();
    usernameController.addListener(() {
      filterUsers();
    });
    myUserId = await getMyUserId();
    myUsername = await getMyUsername();
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

  Future<String> getMyUserId() async {
    String userId = '';
    await userPreference.getUser().then(
      (value) {
        userId = value.user!.id!;
      },
    );
    return userId;
  }

  void fetchUsersApi() {
    _api.fetchUsers().then(
      (value) {
        userList.assignAll(value['data']);
        filteredList.assignAll(value['data']);
        print("Filtered List: $filteredList");
      },
    ).onError(
      (error, stackTrace) {
        print(error.toString());
        Utils.snakBar('Error', error.toString());
        Utils.toastMessage(error.toString());
      },
    );
  }

  Future<void> createChat(String chatId) async {
    _api.createChat(chatId).then(
      (value) {
        selectedChatId = value['data']['_id'];
        print(selectedChatId);
        print(value);
      },
    ).onError(
      (error, stackTrace) {
        print(error.toString());
        Utils.snakBar('Error', error.toString());
        Utils.toastMessage(error.toString());
      },
    );
  }

  void filterUsers() {
    if (usernameController.text.isEmpty) {
      filteredList.assignAll(userList);
    } else {
      filteredList.assignAll(
        userList
            .where(
              (user) => user['username'].toString().toLowerCase().contains(
                    usernameController.text.toLowerCase(),
                  ),
            )
            .toList(),
      );
    }
  }

  // List to store selected user IDs
  RxList<String> selectedUserIds = <String>[].obs;
  RxList<String> selectedUsernames = <String>[].obs;

  void toggleUserSelection(String userId, String username) {
    if (selectedUserIds.contains(userId)) {
      selectedUserIds.remove(userId);
      selectedUsernames.remove(username);
    } else {
      selectedUserIds.add(userId);
      selectedUsernames.add(username);
    }
  }

  Future<void> createGroupChat(String groupName) async {
    Map<String, dynamic> body = {
      "name": groupName,
      "participants": [...selectedUserIds],
    };
    print("Body: $body");
    _api.createGroupChat(body).then(
      (value) {
        // selectedChatId = value['data']['_id'];
        selectedGroupId = value['data']['_id'];
        print(selectedGroupId);
        print(value);
      },
    ).onError(
      (error, stackTrace) {
        print(error.toString());
        Utils.snakBar('Error', error.toString());
        Utils.toastMessage(error.toString());
      },
    );
  }

  @override
  void onClose() {
    usernameController.dispose();
    usernameFocusNode.dispose();
    super.onClose();
  }
}
