import 'package:e_commerce/UI/Home/home_screen/cubit/home_screen_states.dart';
import 'package:e_commerce/UI/Home/home_screen/cubit/home_screen_view_model.dart';
import 'package:e_commerce/UI/Home/widgets/custom_bottom_nav_bar.dart';
import 'package:e_commerce/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenView extends StatelessWidget {
  static const String routename = 'home-screen';

  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenViewModel, HomeScreenStates>(
      bloc: viewModel,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ImageIcon(
                color: AppColors.primaryColor,
                const AssetImage('assets/images/appbar.png'),
              ),
            ),
            leadingWidth: 100,
          ),
          bottomNavigationBar: buildCustomNavigationBar(
            context: context,
            selectedIndex: viewModel.selectedIndex,
            onTapFunction: (index) {
              viewModel.changeNavigationBar(index);
            },
          ),
          body: viewModel.tabs[viewModel.selectedIndex],
        );
      },
    );
  }
}
