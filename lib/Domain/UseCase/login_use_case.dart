import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/repository/auth_repository/repository/auth_repository_contract.dart';

import '../../Data/Api/base_error.dart';
import '../entities/auth_result_entity.dart';

class LoginUseCase {
  /// obj repository
  AuthRepositoryContract repositoryContract;

  LoginUseCase({required this.repositoryContract});

  Future<Either<Failures, AuthResultEntity>> invoke(
      String email, String password) async {
    var either = await repositoryContract.login(email, password);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response);
    });
  }
}
