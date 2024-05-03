import 'package:get/get.dart';
import 'package:peerlink_mobileapp/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class UserPreference extends GetxController {
//   Future<bool> saveUser(UserModel userModel) async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     sp.setString('token', userModel.token.toString());
//     sp.setBool('isLogin', userModel.isLogin!);
//     return true;
//   }

//   Future<UserModel> getUser() async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     String? token = sp.getString('token');
//     bool? isLogin = sp.getBool('isLogin');
//     return UserModel(
//       token: token,
//       isLogin: isLogin,
//     );
//   }

//   Future<bool> removeUser() async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     sp.clear();
//     return true;
//   }
// }

class UserPreference extends GetxController {
  Future<bool> saveUser(UserModel userModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('userId', userModel.user!.id.toString());
    sp.setString('avatarUrl', userModel.user!.avatar!.url.toString());
    sp.setString('avatarId', userModel.user!.avatar!.id.toString());
    sp.setString(
        'avatarlocalPath', userModel.user!.avatar!.localPath.toString());
    sp.setString('username', userModel.user!.username.toString());
    sp.setString('email', userModel.user!.email.toString());
    sp.setString('role', userModel.user!.role.toString());
    sp.setString('createdAt', userModel.user!.createdAt.toString());
    sp.setString('accesstoken', userModel.accessToken.toString());
    sp.setString('refreshtoken', userModel.refreshToken.toString());
    sp.setBool('isLogin', userModel.isLogin!);
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? userId = sp.getString('userId');
    String? avatarUrl = sp.getString('avatarUrl');
    String? avatarId = sp.getString('avatarId');
    String? avatarlocalPath = sp.getString('avatarlocalPath');
    String? username = sp.getString('username');
    String? email = sp.getString('email');
    String? role = sp.getString('role');
    String? createdAt = sp.getString('createdAt');
    String? accessToken = sp.getString('accesstoken');
    String? refreshToken = sp.getString('refreshtoken');
    bool? isLogin = sp.getBool('isLogin');

    return UserModel(
      user: User(
        id: userId,
        avatar: Avatar(
          url: avatarUrl,
          id: avatarId,
          localPath: avatarlocalPath,
        ),
        username: username,
        email: email,
        role: role,
        createdAt: createdAt,
      ),
      accessToken: accessToken,
      refreshToken: refreshToken,
      isLogin: isLogin,
    );
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
