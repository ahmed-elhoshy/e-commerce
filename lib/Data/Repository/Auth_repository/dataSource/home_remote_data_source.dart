import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/entities/ProductsResponseEntity.dart';

import '../../../../Domain/entities/CategoryEntity.dart';
import '../../../Api/base_error.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();

  Future<Either<Failures, ProductsResponseEntity>> getAllProducts();
}

abstract class HomeLocalDataSource {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();

  Future<Either<Failures, ProductsResponseEntity>> getAllProducts();
}
