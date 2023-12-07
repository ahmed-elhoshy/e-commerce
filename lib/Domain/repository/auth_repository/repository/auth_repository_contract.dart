import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entities/auth_result_entity.dart';

import '../../../../Data/Api/base_error.dart';

abstract class AuthRepositoryContract {
  Future<Either<BaseError, AuthResultEntity>> register(String name,
      String email, String password, String rePassword, String phone);

  Future<Either<BaseError, AuthResultEntity>> login(
      String email, String password);
}
