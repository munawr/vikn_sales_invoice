class LoginModel {
  int? success;
  Data? data;
  int? userId;
  String? role;
  String? message;
  Null? error;
  String? username;

  LoginModel(
      {this.success,
        this.data,
        this.userId,
        this.role,
        this.message,
        this.error,
        this.username});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    userId = json['user_id'];
    role = json['role'];
    message = json['message'];
    error = json['error'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['user_id'] = userId;
    data['role'] = role;
    data['message'] = message;
    data['error'] = error;
    data['username'] = username;
    return data;
  }
}

class Data {
  String? refresh;
  String? access;
  int? userId;
  String? role;
  String? username;
  String? email;
  String? lastLogin;

  Data(
      {this.refresh,
        this.access,
        this.userId,
        this.role,
        this.username,
        this.email,
        this.lastLogin});

  Data.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
    userId = json['user_id'];
    role = json['role'];
    username = json['username'];
    email = json['email'];
    lastLogin = json['last_login'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = refresh;
    data['access'] = access;
    data['user_id'] = userId;
    data['role'] = role;
    data['username'] = username;
    data['email'] = email;
    data['last_login'] = lastLogin;
    return data;
  }
}
