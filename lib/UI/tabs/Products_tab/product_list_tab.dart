import 'package:e_commerce/UI/tabs/Products_tab/Cubit/product_list_states.dart';
import 'package:e_commerce/UI/tabs/Products_tab/Cubit/product_list_view_model.dart';
import 'package:e_commerce/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Domain/di.dart';
import 'Widgets/product_item.dart';

class ProductListTab extends StatelessWidget {
  ProductListViewModel viewModel = ProductListViewModel(
      getAllProductsUseCase: injectGetAllProductsUseCase());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductListViewModel, ProductListStates>(
          bloc: viewModel..getProducts(),
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(26),
                          color: Theme.of(context).colorScheme.surface,
                          border: (Border.all(
                              color: AppColors.primaryColor, width: 1)),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.search,
                                  color: AppColors.primaryColor,
                                  size: 30,
                                )),
                            Text(
                              'what do you search for ?',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        )),
                    IconButton(
                        onPressed: () {
                          // Navigator.of(context)
                          //     .pushNamed(AddToCart.routename);
                        },
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          color: AppColors.primaryColor,
                          size: 30,
                        )),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                state is ProductLoadingState
                    ? Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 25,
                                    childAspectRatio: 1 / 1.1),
                            itemCount: viewModel.productsList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  // Navigator.of(context).pushNamed(
                                  //     ProductDetails.routename,
                                  //     arguments: viewModel.productsList[index]);
                                },
                                child: ProductItem(
                                    productsEntity:
                                        viewModel.productsList[index]),
                              );
                            }),
                      )
              ],
            );
          }),
    );
  }
}
