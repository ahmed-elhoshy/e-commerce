import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Api/base_error.dart';
import 'package:e_commerce/Domain/entities/CategoryEntity.dart';
import 'package:e_commerce/Domain/entities/ProductsResponseEntity.dart';

abstract class HomeRepositoryContract {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();

  Future<Either<Failures, ProductsResponseEntity>> getAllProducts();
}
