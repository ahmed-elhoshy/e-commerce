import '../../../../Domain/entities/CategoryEntity.dart';

abstract class HomeTabStates {}

class HomeTabInitialStates extends HomeTabStates {}

class HomeTabCategoryLoadingStates extends HomeTabStates {
  String? loadingMessage;

  HomeTabCategoryLoadingStates({required this.loadingMessage});
}

class HomeTabCategoryErrorStates extends HomeTabStates {
  String? errorMessage;

  HomeTabCategoryErrorStates({required this.errorMessage});
}

class HomeTabCategorySuccessStates extends HomeTabStates {
  /// response - List of categories
  CategoryOrBrandResponseEntity responseEntity;

  HomeTabCategorySuccessStates({required this.responseEntity});
}

class HomeTabBrandLoadingStates extends HomeTabStates {
  String? loadingMessage;

  HomeTabBrandLoadingStates({required this.loadingMessage});
}

class HomeTabBrandErrorStates extends HomeTabStates {
  String? errorMessage;

  HomeTabBrandErrorStates({required this.errorMessage});
}

class HomeTabBrandSuccessStates extends HomeTabStates {
  /// response - List of categories
  CategoryOrBrandResponseEntity responseEntity;

  HomeTabBrandSuccessStates({required this.responseEntity});
}
