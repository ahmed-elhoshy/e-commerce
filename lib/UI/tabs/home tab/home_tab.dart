import 'package:e_commerce/Domain/di.dart';
import 'package:e_commerce/UI/Home/widgets/category_section.dart';
import 'package:e_commerce/UI/Home/widgets/slideshow.dart';
import 'package:e_commerce/UI/tabs/home%20tab/cubit/home_tab_states.dart';
import 'package:e_commerce/UI/tabs/home%20tab/cubit/home_tab_view_model.dart';
import 'package:e_commerce/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Home/widgets/search_bar.dart';

class HomeTab extends StatelessWidget {
  HomeTabViewModel viewModel =
      HomeTabViewModel(getAllCategoryUseCase: injectGetAllCategoryUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      bloc: viewModel
        ..getCategories()
        ..getBrands(),
      builder: (context, state) => viewModel.categoriesList.isEmpty &&
              viewModel.brandsList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ))
          : Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  children: [
                    CustomSearchBar(),
                    SizedBox(
                      height: 10.h,
                    ),
                    SlideShow(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 8, right: 0, bottom: 10, top: 10),
                          child: Text(
                            'Categories',
                            style: TextStyle(
                                fontSize: 20,
                                color: AppColors.navyTextColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(right: 20, bottom: 10, top: 17),
                          child: Text(
                            'view all',
                            style: TextStyle(
                                color: AppColors.navyTextColor,
                                fontSize: 15.sp),
                          ),
                        ),
                      ],
                    ),

                    CategorySection(
                      categoriesList: viewModel.categoriesList,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
