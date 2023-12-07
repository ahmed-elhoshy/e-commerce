import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Api/api_manager.dart';
import 'package:e_commerce/Data/Api/base_error.dart';
import 'package:e_commerce/Domain/entities/CategoryEntity.dart';
import 'package:e_commerce/Domain/entities/ProductsResponseEntity.dart';

import 'home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>>
      getAllCategories() async {
    var either = await apiManager.getCategories();
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() {
    // TODO: implement getAllBrands
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, ProductsResponseEntity>> getAllProducts() async {
    // TODO: implement getAllProducts
    var either = await apiManager.getProducts();
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    }, (response) {
      return Right(response);
    });
  }
}
