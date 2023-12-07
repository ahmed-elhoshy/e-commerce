import 'package:e_commerce/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldItem extends StatelessWidget {
  String fieldName;
  String hintText;
  TextInputType keyboardType;
  Widget? suffixIcon;
  TextEditingController controller;
  String? Function(String?) validator;
  bool isObsecure;

  TextFieldItem({
    required this.fieldName,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    required this.controller,
    required this.validator,
    this.isObsecure = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          fieldName,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 18.sp),
          textAlign: TextAlign.start,
        ),
        Padding(
          padding: EdgeInsets.only(top: 24.h, bottom: 20.h),
          child: TextFormField(
            decoration: InputDecoration(
                fillColor: AppColors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r)),
                hintText: hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColors.grey),
                suffixIcon: suffixIcon),
            style: TextStyle(color: AppColors.black),
            controller: controller,
            validator: validator,
            obscureText: isObsecure,
            keyboardType: keyboardType,
          ),
        ),
      ],
    );
  }
}
