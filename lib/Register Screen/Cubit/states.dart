import 'package:e_commerce/Domain/entities/auth_result_entity.dart';

abstract class RegisterStates {}

class RegisterLoadingState extends RegisterStates {
  String? loadingMessage;

  RegisterLoadingState({required this.loadingMessage});
}

class RegisterErrorState extends RegisterStates {
  String? errorMessage;

  RegisterErrorState({required this.errorMessage});
}

class RegisterSuccessState extends RegisterStates {
  AuthResultEntity response;

  RegisterSuccessState({required this.response});
}

class RegisterInitialState extends RegisterStates {}
