import 'package:e_commerce/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCustomNavigationBar({
  required int selectedIndex,
  required Function(int) onTapFunction,
  required BuildContext context,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
    child: BottomNavigationBar(
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primaryColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: onTapFunction,
      items: [
        BottomNavigationBarItem(
          icon: CircleAvatar(
            foregroundColor:
                selectedIndex == 0 ? AppColors.primaryColor : AppColors.white,
            backgroundColor:
                selectedIndex == 0 ? AppColors.white : Colors.transparent,
            radius: 20.r,
            child: ImageIcon(
              size: 40.sp,
              const AssetImage('assets/images/home.png'),
            ),
          ),
          label: 'HOME',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            foregroundColor:
                selectedIndex == 1 ? AppColors.primaryColor : AppColors.white,
            backgroundColor:
                selectedIndex == 1 ? AppColors.white : Colors.transparent,
            radius: 20.r,
            child: ImageIcon(
              size: 40.sp,
              const AssetImage('assets/images/category.png'),
            ),
          ),
          label: 'CATEGORY',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            foregroundColor:
                selectedIndex == 2 ? AppColors.primaryColor : AppColors.white,
            backgroundColor:
                selectedIndex == 2 ? AppColors.white : Colors.transparent,
            radius: 20.r,
            child: ImageIcon(
              size: 40.sp,
              const AssetImage('assets/images/heart.png'),
            ),
          ),
          label: 'FAVOURITES',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            foregroundColor:
                selectedIndex == 3 ? AppColors.primaryColor : AppColors.white,
            backgroundColor:
                selectedIndex == 3 ? AppColors.white : Colors.transparent,
            radius: 20.r,
            child: ImageIcon(
              size: 40.sp,
              const AssetImage('assets/images/vector.png'),
            ),
          ),
          label: 'PROFILE',
        ),
      ],
    ),
  );
}
