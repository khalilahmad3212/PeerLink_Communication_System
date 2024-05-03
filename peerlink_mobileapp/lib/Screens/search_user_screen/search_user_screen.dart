import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peerlink_mobileapp/Screens/search_user_screen/search_user_controller.dart';
import 'package:peerlink_mobileapp/res/colors/app_color.dart';
import 'package:peerlink_mobileapp/res/navigators/routes_name.dart';
import 'package:peerlink_mobileapp/utils/responsive_size_util.dart';

class SearchUser extends StatefulWidget {
  const SearchUser({super.key});

  @override
  State<SearchUser> createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUser> {
  SearchUserController searchUserController = Get.put(SearchUserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appbarColor,
        foregroundColor: AppColor.secondaryColor,
        actions: [
          Container(
            height: 40,
            width: ResponsiveSizeUtil.scaleFactorWidth * 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFF0F0F0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 3,
              ),
              child: TextFormField(
                controller: searchUserController.usernameController,
                focusNode: searchUserController.usernameFocusNode,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
                // onFieldSubmitted: (value) => {
                //   Utils.fieldFocusChange(
                //       context,
                //       loginController.emailFocusNode.value,
                //       loginController.passwordFocusNode.value)
                // },
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColor.blackColor,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColor.primaryColor,
                  ),
                  hintText: 'Search User',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: AppColor.greyColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body:
          // searchUserController.filteredList.isEmpty
          //     ? Center(
          //         child: Text(
          //           'Search User',
          //           style: TextStyle(
          //               fontSize: 18,
          //               color: AppColor.greyColor,
          //               fontWeight: FontWeight.bold),
          //         ),
          //       )
          //     :
          Obx(
        () => ListView.builder(
          itemCount: searchUserController.filteredList.length,
          itemBuilder: (context, index) {
            var user = searchUserController.filteredList[index];
            return GestureDetector(
              onTap: () async {
                try {
                  await searchUserController.createChat(user['_id']);
                  print(
                      "Selected Chat Id: ${searchUserController.selectedChatId}");

                  if (searchUserController.selectedChatId.isNotEmpty) {
                    Get.toNamed(
                      RouteName.chatScreen,
                      arguments: {
                        'chatId': searchUserController.selectedChatId,
                        'name': user['username'],
                        'isGroupChat': false,
                      },
                    );
                  } else {
                    print("Chat ID is empty, cannot navigate");
                  }
                } catch (e) {
                  print("Error in creating chat or navigating: $e");
                  // Utils.snakBar('Error', e.toString());
                }
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user['avatar']['url']),
                ),
                title: Text(user['username']),
                subtitle: Text(user['email']),
              ),
            );
          },
        ),
      ),
    );
  }
}
