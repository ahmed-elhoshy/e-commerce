import 'package:dartz/dartz.dart';

import '../../Data/Api/base_error.dart';
import '../entities/CategoryEntity.dart';
import '../repository/home_repository_contract.dart';

class GetAllCategoryUseCase {
  /// el uc 3shan tgeeb el cat. me7taga tklm el repository
  HomeRepositoryContract repositoryContract;

  GetAllCategoryUseCase({required this.repositoryContract});

  Future<Either<Failures, CategoryOrBrandResponseEntity>> invoke() {
    return repositoryContract.getAllCategories();
  }
}
