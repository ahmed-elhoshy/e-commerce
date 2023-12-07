import 'package:e_commerce/UI/tabs/Products_tab/Cubit/product_list_states.dart';
import 'package:e_commerce/UI/tabs/Products_tab/Cubit/product_list_view_model.dart';
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
                state is ProductLoadingState
                    ? Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 25,
                                    childAspectRatio: 1 / 1.30),
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
