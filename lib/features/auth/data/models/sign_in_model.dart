class SignInModel {
  int? code;
  String? status;
  String? msg;
  Data? data;

  SignInModel({this.code, this.status, this.msg, this.data});

  SignInModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

class User {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  bool? emailVerified;
  String? phone;
  bool? phoneVerified;
  Null avatarUrl;
  String? city;
  int? role;

  User(
      {this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.emailVerified,
      this.phone,
      this.phoneVerified,
      this.avatarUrl,
      this.city,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerified = json['email_verified'];
    phone = json['phone'];
    phoneVerified = json['phone_verified'];
    avatarUrl = json['avatar_url'];
    city = json['city'];
    role = json['role'];
  }
}
