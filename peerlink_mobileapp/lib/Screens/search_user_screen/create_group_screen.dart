import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peerlink_mobileapp/Screens/search_user_screen/search_user_controller.dart';
import 'package:peerlink_mobileapp/res/colors/app_color.dart';
import 'package:peerlink_mobileapp/res/navigators/routes_name.dart';
import 'package:peerlink_mobileapp/utils/responsive_size_util.dart';

class CreateGroupChat extends StatefulWidget {
  const CreateGroupChat({super.key});

  @override
  State<CreateGroupChat> createState() => _CreateGroupChatState();
}

class _CreateGroupChatState extends State<CreateGroupChat> {
  SearchUserController searchUserController = Get.put(SearchUserController());

  final _formKey = GlobalKey<FormState>();

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
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return 'Please enter username';
                //   }
                //   return null;
                // },
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
                  hintText: 'Search User to add in Group',
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
      body: Column(
        children: [
          const SizedBox(height: 10),
          // Expanded(
          //   child: Obx(
          //     () => ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: searchUserController.selectedUserIds.length,
          //       itemBuilder: (context, index) {
          //         var user = searchUserController.selectedUserIds[index];
          //         return Chip(
          //           label: Text(user),
          //           onDeleted: () {
          //             searchUserController.toggleUserSelection(user);
          //           },
          //         );
          //         // Row(
          //         //   children: [
          //         //     Container(
          //         //       // margin: const EdgeInsets.symmetric(horizontal: 5),
          //         //       padding: const EdgeInsets.only(left: 10),
          //         //       height: 35,
          //         //       // width: 130,
          //         //       decoration: BoxDecoration(
          //         //         color: AppColor.primaryColor,
          //         //         borderRadius: BorderRadius.circular(10),
          //         //       ),
          //         //       child: Row(
          //         //         crossAxisAlignment: CrossAxisAlignment.center,
          //         //         children: [
          //         //           Text(user),
          //         //           IconButton(
          //         //             icon: const Icon(
          //         //               Icons.close,
          //         //               size: 20,
          //         //             ),
          //         //             onPressed: () {
          //         //               searchUserController.toggleUserSelection(user);
          //         //             },
          //         //           ),
          //         //         ],
          //         //       ),
          //         //     ),
          //         //     const SizedBox(
          //         //       width: 10,
          //         //     ),
          //         //   ],
          //         // );
          //       },
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      searchUserController.selectedUsernames.map((username) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Chip(
                        label: Text(username),
                        onDeleted: () {
                          searchUserController.toggleUserSelection(
                              searchUserController.selectedUserIds[
                                  searchUserController.selectedUsernames
                                      .indexOf(username)],
                              username);
                        },
                      ),
                    );
                  }).toList(),
                );
              }),
            ),
          ),
          Form(
            key: _formKey,
            child: Row(
              children: [
                const Spacer(),
                Container(
                  height: 40,
                  width: ResponsiveSizeUtil.scaleFactorWidth * 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFF0F0F0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 3,
                    ),
                    child: TextFormField(
                      controller: searchUserController.groupname,
                      // focusNode: searchUserController.usernameFocusNode,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Group Name';
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
                          Icons.group,
                          color: AppColor.primaryColor,
                        ),
                        hintText: 'Enter Group Name',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: AppColor.greyColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // searchUserController
                      //     .createGroupChat(searchUserController.groupname.text);
                      try {
                        await searchUserController.createGroupChat(
                            searchUserController.groupname.text);
                        print(
                            "Selected Chat Id: ${searchUserController.selectedGroupId}");

                        if (searchUserController.selectedGroupId.isNotEmpty) {
                          Get.toNamed(
                            RouteName.chatScreen,
                            arguments: {
                              'chatId': searchUserController.selectedChatId,
                              'name': searchUserController.groupname.text,
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
                    }
                  },
                  style: const ButtonStyle(
                      foregroundColor:
                          MaterialStatePropertyAll(AppColor.whiteColor),
                      backgroundColor:
                          MaterialStatePropertyAll(AppColor.primaryColor)),
                  child: const Text("Create"),
                ),
                const Spacer(),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: searchUserController.filteredList.length,
                itemBuilder: (context, index) {
                  var user = searchUserController.filteredList[index];
                  return GestureDetector(
                    onTap: () async {
                      searchUserController.toggleUserSelection(
                        user['_id'],
                        user['username'],
                      );
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
          ),
        ],
      ),
    );
  }
}
