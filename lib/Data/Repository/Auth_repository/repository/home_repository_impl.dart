import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Api/base_error.dart';
import 'package:e_commerce/Data/Repository/Auth_repository/dataSource/home_remote_data_source.dart';
import 'package:e_commerce/Domain/entities/CategoryEntity.dart';
import 'package:e_commerce/Domain/entities/ProductsResponseEntity.dart';
import 'package:e_commerce/Domain/repository/home_repository_contract.dart';

class HomeRepositoryImpl implements HomeRepositoryContract {
  HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories() {
    return remoteDataSource.getAllCategories();
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() {
    // TODO: implement getAllBrands
    return remoteDataSource.getAllBrands();
  }

  @override
  Future<Either<Failures, ProductsResponseEntity>> getAllProducts() {
    // TODO: implement getAllProducts
    return remoteDataSource.getAllProducts();
  }
}
