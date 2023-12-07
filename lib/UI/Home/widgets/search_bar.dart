import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utils/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: TextField(
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.h),
                hintText: 'Search for what you want ',
                hintStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColors.grey,
                ),
                prefixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: AppColors.primaryColor,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                border: buildBorder(),
                enabledBorder: buildBorder(),
                focusedBorder: buildBorder().copyWith(
                    borderSide: const BorderSide(
                        color: AppColors.primaryColor, width: 2))),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.primaryColor,
              size: 30,
            ))
      ],
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(26),
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
    );
  }
}
