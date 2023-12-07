import 'package:e_commerce/UI/Home/home_screen/cubit/home_screen_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../tabs/Products_tab/product_list_tab.dart';
import '../../../tabs/favourites_tab.dart';
import '../../../tabs/home tab/home_tab.dart';
import '../../../tabs/profile_tab.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel() : super(HomeScreenInitialState());
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    ProductListTab(),
    FavouritesTab(),
    ProfileTab()
  ];

  void changeNavigationBar(int newIndex) {
    selectedIndex = newIndex;
    emit(changeNavigationBarState());
  }
}
