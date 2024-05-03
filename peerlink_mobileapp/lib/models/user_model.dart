// Use website JSON to Dart https://javiercbk.github.io/json_to_dart/ to convert your login api body response into dart model

//class UserModel {
//  String? userId;
//  String? username;
//  String? email;
//  String? token;
//  bool? isLogin;
//
//  UserModel({this.token, this.isLogin});
//
//  UserModel.fromJson(Map<String, dynamic> json) {
//    token = json['token'];
//    isLogin = json['isLogin'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['token'] = this.token;
//    data['isLogin'] = this.isLogin;
//    return data;
//  }
//}

class UserModel {
  User? user;
  String? accessToken;
  String? refreshToken;
  bool? isLogin;

  UserModel({this.user, this.accessToken, this.refreshToken, this.isLogin});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    isLogin = json['isLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    data['isLogin'] = isLogin;
    return data;
  }
}

class User {
  String? id;
  Avatar? avatar;
  String? username;
  String? email;
  String? role;
  String? loginType;
  bool? isEmailVerified;
  String? createdAt;
  String? updatedAt;
  int? v;

  User(
      {this.id,
      this.avatar,
      this.username,
      this.email,
      this.role,
      this.loginType,
      this.isEmailVerified,
      this.createdAt,
      this.updatedAt,
      this.v});

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    avatar =
        json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null;
    username = json['username'];
    email = json['email'];
    role = json['role'];
    loginType = json['loginType'];
    isEmailVerified = json['isEmailVerified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    if (avatar != null) {
      data['avatar'] = avatar!.toJson();
    }
    data['username'] = username;
    data['email'] = email;
    data['role'] = role;
    data['loginType'] = loginType;
    data['isEmailVerified'] = isEmailVerified;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = v;
    return data;
  }
}

class Avatar {
  String? url;
  String? localPath;
  String? id;

  Avatar({this.url, this.localPath, this.id});

  Avatar.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    localPath = json['localPath'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['localPath'] = localPath;
    data['_id'] = id;
    return data;
  }
}
