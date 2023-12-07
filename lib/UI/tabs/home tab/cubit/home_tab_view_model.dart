import 'package:e_commerce/UI/tabs/home%20tab/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Domain/UseCase/get_all_categories_use_case.dart';
import '../../../../Domain/entities/CategoryEntity.dart';

class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoryUseCase getAllCategoryUseCase;

  HomeTabViewModel({required this.getAllCategoryUseCase})
      : super(HomeTabInitialStates());
  List<CategoryOrBrandEntity> categoriesList = [];
  List<CategoryOrBrandEntity> brandsList = [];

  void getCategories() async {
    emit(HomeTabCategoryLoadingStates(loadingMessage: 'loading...'));
    var either = await getAllCategoryUseCase.invoke();
    either.fold((l) {
      emit(HomeTabCategoryErrorStates(errorMessage: l.errorMessage));
    }, (response) {
      categoriesList = response.data ?? [];
      if (brandsList.isNotEmpty) {
        emit(HomeTabCategorySuccessStates(responseEntity: response));
      }
    });
  }

  void getBrands() async {
    emit(HomeTabBrandLoadingStates(loadingMessage: 'loading...'));
    var either = await getAllCategoryUseCase.invoke();
    either.fold((l) {
      emit(HomeTabBrandErrorStates(errorMessage: l.errorMessage));
    }, (response) {
      brandsList = response.data ?? [];
      if (categoriesList.isNotEmpty) {
        emit(HomeTabBrandSuccessStates(responseEntity: response));
      }
    });
  }
}
