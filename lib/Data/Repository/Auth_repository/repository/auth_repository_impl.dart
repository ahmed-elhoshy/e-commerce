import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/repository/auth_repository/dataSource/auth_remote_data_source.dart';
import 'package:e_commerce/Domain/repository/auth_repository/repository/auth_repository_contract.dart';

import '../../../../Domain/entities/auth_result_entity.dart';
import '../../../Api/base_error.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, AuthResultEntity>> register(String name, String email,
      String password, String rePassword, String phone) {
    return remoteDataSource.register(name, email, password, rePassword, phone);
  }

  @override
  Future<Either<Failures, AuthResultEntity>> login(
      String email, String password) {
    return remoteDataSource.login(email, password);
  }
}
