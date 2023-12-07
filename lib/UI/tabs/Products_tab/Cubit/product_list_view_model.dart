import 'package:e_commerce/Domain/entities/ProductsResponseEntity.dart';
import 'package:e_commerce/UI/tabs/Products_tab/Cubit/product_list_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Domain/UseCase/get_all_products_use_case.dart';

class ProductListViewModel extends Cubit<ProductListStates> {
  GetAllProductsUseCase getAllProductsUseCase;

  ProductListViewModel({required this.getAllProductsUseCase})
      : super(ProductInitialState());
  List<ProductsEntity> productsList = [];

  void getProducts() async {
    emit(ProductLoadingState(loadingMessage: 'Loading...'));
    var either = await getAllProductsUseCase.invoke();
    either.fold((l) {
      emit(ProductErrorState(errors: l));
    }, (response) {
      productsList = response.data ?? [];
      emit(ProductSuccessState(responseEntity: response));
    });
  }
}
