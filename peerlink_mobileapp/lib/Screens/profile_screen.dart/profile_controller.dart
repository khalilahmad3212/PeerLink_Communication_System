import 'package:get/get.dart';
import 'package:peerlink_mobileapp/user_preference/user_preference_controller.dart';

class ProfileController extends GetxController {
  UserPreference userPreference = UserPreference();
  RxString myUsername = ''.obs;
  RxString myUserId = ''.obs;
  RxString avatar = ''.obs;
  RxString role = ''.obs;
  RxString bio = ''.obs;
  RxString email = ''.obs;
  RxString createdAt = ''.obs;

  Map<String, String> consultancyHours = {
    'Monday': '10:00 AM - 12:00 PM',
    'Tuesday': '10:00 AM - 12:00 PM',
    'Wednesday': '10:00 AM - 12:00 PM',
    'Thursday': '10:00 AM - 12:00 PM',
    'Friday': '10:00 AM - 12:00 PM',
    'Saturday': '10:00 AM - 12:00 PM',
    'Sunday': '10:00 AM - 12:00 PM',
  };

  @override
  void onInit() async {
    super.onInit();
    myUsername.value = await getMyUsername();
    myUserId.value = await getMyUserId();
    avatar.value = await getMyAvatar();
    role.value = await getMyRole();
    bio.value = 'Hello, I am $myUsername and I am a $role at SIBA';
    email.value = await getMyEmail();
    createdAt.value = await getMyCreatedAt();
    print(
        "My Username: $myUsername\nMy UserId: $myUserId\nMy Avatar: $avatar\nMy Role: $role\nMy Bio: $bio");
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

  Future<String> getMyAvatar() async {
    String avatar = '';
    await userPreference.getUser().then(
      (value) {
        avatar = value.user!.avatar!.url!;
      },
    );
    return avatar;
  }

  Future<String> getMyRole() async {
    String role = '';
    await userPreference.getUser().then(
      (value) {
        role = value.user!.role!;
      },
    );
    return role;
  }

  Future<String> getMyEmail() async {
    String email = '';
    await userPreference.getUser().then(
      (value) {
        email = value.user!.email!;
      },
    );
    return email;
  }

  Future<String> getMyCreatedAt() async {
    String createdAt = '';
    await userPreference.getUser().then(
      (value) {
        createdAt = value.user!.createdAt!;
      },
    );
    return createdAt;
  }
}
