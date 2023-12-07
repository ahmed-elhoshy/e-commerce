import 'package:e_commerce/Domain/entities/auth_result_entity.dart';

import 'Errors.dart';
import 'UserDto.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmuttih1@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NjlmYWY0MjgxYzkxNmM3YTc5MjYzNSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzAxNDQ0MzQwLCJleHAiOjE3MDkyMjAzNDB9.o2YJz1wca_51jjJ1d2ErIlCQ5cXpHIy5CL5X_deg5Zg"

class RegisterResponse {
  RegisterResponse({
    this.message,
    this.user,
    this.token,
    this.error,
    this.statusMsg,
  });

  RegisterResponse.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    error = json['errors'] != null ? Error.fromJson(json['errors']) : null;

    ///khle balak en el key yb2a nfs esm el key el fl postman respons (bl 'S')
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;
  UserDto? user;
  String? token;
  Error? error;
  String? statusMsg;

  RegisterResponse copyWith({
    String? message,
    UserDto? user,
    String? token,
  }) =>
      RegisterResponse(
        message: message ?? this.message,
        user: user ?? this.user,
        token: token ?? this.token,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    map['errors'] = error;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(token: token, userEntity: user?.toUserEntity());
  }
}
