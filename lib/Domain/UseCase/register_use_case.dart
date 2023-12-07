import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Repository/Auth_repository/repository/auth_repository_impl.dart';
import 'package:e_commerce/Domain/entities/auth_result_entity.dart';
import 'package:e_commerce/Domain/repository/auth_repository/repository/auth_repository_contract.dart';

import '../../Data/Api/base_error.dart';

class RegisterUseCase {
  AuthRepositoryContract repositoryContract;

  RegisterUseCase({required this.repositoryContract});

  Future<Either<BaseError, AuthResultEntity>> invoke(String name, String email,
      String password, String rePassword, String phone) async {
    var either = await repositoryContract.register(
        name, email, password, rePassword, phone);
    return either.fold((l) {
      return Left(BaseError(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response);
    });
  }
}

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(repositoryContract: injectAuthRepository());
}
