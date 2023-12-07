import 'package:e_commerce/Data/Repository/Auth_repository/dataSource/home_remote_data_source.dart';
import 'package:e_commerce/Data/Repository/Auth_repository/dataSource/home_remote_data_source_impl.dart';
import 'package:e_commerce/Data/Repository/Auth_repository/repository/home_repository_impl.dart';
import 'package:e_commerce/Domain/UseCase/get_all_categories_use_case.dart';
import 'package:e_commerce/Domain/UseCase/get_all_products_use_case.dart';
import 'package:e_commerce/Domain/repository/auth_repository/dataSource/auth_remote_data_source.dart';
import 'package:e_commerce/Domain/repository/auth_repository/repository/auth_repository_contract.dart';
import 'package:e_commerce/Domain/repository/home_repository_contract.dart';

import '../Data/Api/api_manager.dart';
import '../Data/Repository/Auth_repository/dataSource/auth_remote_data_source_impl.dart';
import '../Data/Repository/Auth_repository/repository/auth_repository_impl.dart';
import 'UseCase/login_use_case.dart';
import 'UseCase/register_use_case.dart';

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

AuthRepositoryContract injectAuthRepository() {
  return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(repositoryContract: injectAuthRepository());
}

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(repositoryContract: injectAuthRepository());
}

GetAllCategoryUseCase injectGetAllCategoryUseCase() {
  return GetAllCategoryUseCase(
      repositoryContract: injectHomeRepositoryContract());
}

GetAllProductsUseCase injectGetAllProductsUseCase() {
  return GetAllProductsUseCase(
      repositoryContract: injectHomeRepositoryContract());
}

HomeRepositoryContract injectHomeRepositoryContract() {
  return HomeRepositoryImpl(remoteDataSource: injectHomeRemoteDataSource());
}

HomeRemoteDataSource injectHomeRemoteDataSource() {
  return HomeRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
