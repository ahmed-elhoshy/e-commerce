import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entities/ProductsResponseEntity.dart';

import '../../Data/Api/base_error.dart';
import '../repository/home_repository_contract.dart';

class GetAllProductsUseCase {
  /// el uc 3shan tgeeb el cat. me7taga tklm el repository
  HomeRepositoryContract repositoryContract;

  GetAllProductsUseCase({required this.repositoryContract});

  Future<Either<Failures, ProductsResponseEntity>> invoke() {
    return repositoryContract.getAllProducts();
  }
}
