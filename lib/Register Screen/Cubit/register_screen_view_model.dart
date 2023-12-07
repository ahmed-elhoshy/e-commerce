import 'package:e_commerce/Register%20Screen/Cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Domain/UseCase/register_use_case.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterScreenViewModel({required this.registerUseCase})
      : super(RegisterInitialState());
  var nameController = TextEditingController(text: 'ahmed');

  var numberController = TextEditingController(text: '01204069284');

  var emailController = TextEditingController(text: 'ahmed@gmail.com');

  var passwordController = TextEditingController(text: '12345678');

  var rePasswordController = TextEditingController(text: '12345678');

  var formKey = GlobalKey<FormState>();

  bool isObsecure = true;

  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState(loadingMessage: 'Loading...'));

      var either = await registerUseCase.invoke(
          nameController.text,
          emailController.text,
          passwordController.text,
          rePasswordController.text,
          numberController.text);
      either.fold((l) {
        emit(RegisterErrorState(errorMessage: l.errorMessage));
      }, (response) {
        emit(RegisterSuccessState(response: response));
      });
    }

    // Navigator.pushReplacementNamed(
    //     context, LoginScreen.routename);
  }
}
