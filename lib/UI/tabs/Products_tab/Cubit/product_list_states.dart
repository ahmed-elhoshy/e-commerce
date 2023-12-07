import 'package:e_commerce/Data/Api/base_error.dart';
import 'package:e_commerce/Domain/entities/ProductsResponseEntity.dart';

abstract class ProductListStates {}

class ProductInitialState extends ProductListStates {}

class ProductSuccessState extends ProductListStates {
  ProductsResponseEntity responseEntity;

  ProductSuccessState({required this.responseEntity});
}

class ProductLoadingState extends ProductListStates {
  String? loadingMessage;

  ProductLoadingState({required this.loadingMessage});
}

class ProductErrorState extends ProductListStates {
  Failures errors;

  ProductErrorState({required this.errors});
}
