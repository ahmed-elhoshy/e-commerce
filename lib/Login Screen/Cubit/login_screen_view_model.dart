import 'package:e_commerce/Login%20Screen/Cubit/login_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Domain/UseCase/login_use_case.dart';

class LoginScreenViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;

  LoginScreenViewModel({required this.loginUseCase})
      : super(LoginInitialState());
  var emailController = TextEditingController(text: 'ahmed@gmail.com');

  var passwordController = TextEditingController(text: '12345678');

  var formKey = GlobalKey<FormState>();

  bool isObscure = true;

  void login() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginLoadingState(loadingMessage: 'Loading...'));
      var either = await loginUseCase.invoke(
          emailController.text, passwordController.text);
      either.fold((l) {
        emit(LoginErrorState(errorMessage: l.errorMessage));
      }, (response) {
        emit(LoginSuccessState(response: response));
      });
    }
  }
}
