import 'package:e_commerce/Domain/UseCase/register_use_case.dart';
import 'package:e_commerce/Register%20Screen/Cubit/register_screen_view_model.dart';
import 'package:e_commerce/Register%20Screen/Cubit/states.dart';
import 'package:e_commerce/Utils/app_colors.dart';
import 'package:e_commerce/Utils/dialogUtils.dart';
import 'package:e_commerce/Utils/text_field_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  static const String routename = 'register-screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var viewModel =
      RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context, state.loadingMessage ?? 'waiting');
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!,
              posActionName: 'Ok', title: 'Error');
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context, state.response.userEntity?.name ?? '',
              posActionName: 'Ok', title: 'Hello');
        }
      },
      child: Scaffold(
        body: Container(
          color: Theme.of(context).primaryColor,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 91.h,
                    bottom: 15.h,
                    left: 97.w,
                    right: 97.w,
                  ),
                  child: Image.asset('assets/images/route.png'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: Form(
                          key: viewModel.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFieldItem(
                                fieldName: 'Full Name',
                                hintText: 'enter your full name',
                                controller: viewModel.nameController,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter your full name';
                                  }
                                  return null;
                                },
                              ),
                              TextFieldItem(
                                fieldName: 'Mobile Number',
                                hintText: 'enter your mobile no.',
                                controller: viewModel.numberController,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter your mobile number';
                                  }
                                  bool numberValid =
                                      RegExp(r'[0-9]').hasMatch(value);
                                  if (!numberValid) {
                                    return 'Please enter valid number';
                                  }
                                  return null;
                                },
                              ),
                              TextFieldItem(
                                fieldName: 'E-mail address',
                                hintText: 'enter your email address',
                                controller: viewModel.emailController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter your email address';
                                  }
                                  bool emailValid = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value);
                                  if (!emailValid) {
                                    return 'Please enter valid email';
                                  }
                                  return null;
                                },
                              ),
                              TextFieldItem(
                                fieldName: 'Password',
                                hintText: 'enter your password',
                                controller: viewModel.passwordController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  if (value.trim()!.length < 8 ||
                                      value.trim()!.length > 30) {
                                    return 'password should be >8 & <30';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.visiblePassword,
                                isObsecure: viewModel.isObsecure,
                                suffixIcon: InkWell(
                                  child: viewModel.isObsecure
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onTap: () {
                                    if (viewModel.isObsecure) {
                                      viewModel.isObsecure = false;
                                    } else {
                                      viewModel.isObsecure = true;
                                    }
                                    setState(() {});
                                  },
                                ),
                              ),
                              TextFieldItem(
                                fieldName: 'Confirm Password',
                                hintText: 'enter your password',
                                controller: viewModel.rePasswordController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  if (value !=
                                      viewModel.passwordController.text) {
                                    return "password doesn't match";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.visiblePassword,
                                isObsecure: viewModel.isObsecure,
                                suffixIcon: InkWell(
                                  child: viewModel.isObsecure
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onTap: () {
                                    if (viewModel.isObsecure) {
                                      viewModel.isObsecure = false;
                                    } else {
                                      viewModel.isObsecure = true;
                                    }
                                    setState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35.h),
                        child: ElevatedButton(
                          onPressed: () {
                            viewModel.register();
                          },
                          child: Container(
                            height: 64.h,
                            width: 398.w,
                            child: Center(
                              child: Text(
                                'Sign up',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        color: AppColors.primaryColor,
                                        fontSize: 20.sp),
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.r)))),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
