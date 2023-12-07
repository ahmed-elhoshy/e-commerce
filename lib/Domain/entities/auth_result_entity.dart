import 'package:e_commerce/Domain/entities/UserEntity.dart';

class AuthResultEntity {
  UserEntity? userEntity;
  String? token;

  AuthResultEntity({this.userEntity, this.token});
}
