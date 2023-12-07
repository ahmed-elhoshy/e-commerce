import '../../../Domain/entities/auth_result_entity.dart';
import 'UserDto.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti23@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0MjhjNmEwYzE5MjFkMDFkMmM0OTVlZSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzAxOTAzNDI4LCJleHAiOjE3MDk2Nzk0Mjh9.ecpXPI6BIkAP2OvO080q6gGRL6krNnNpg_NO0fh9NeY"

class LoginResponse {
  LoginResponse({
    this.message,
    this.user,
    this.token,
    this.statusMsg,
  });

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;

  LoginResponse copyWith({
    String? message,
    UserDto? user,
    String? token,
  }) =>
      LoginResponse(
        message: message ?? this.message,
        user: user ?? this.user,
        token: token ?? this.token,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = message;

    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(userEntity: user?.toUserEntity(), token: token);
  }
}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmutti23@gmail.com"
/// role : "user"
