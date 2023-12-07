import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/UI/tabs/Products_tab/Widgets/view_product_button.dart';
import 'package:e_commerce/Utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../Domain/entities/ProductsResponseEntity.dart';

//ignore: must_be_immutable
class ProductItem extends StatelessWidget {
  ProductsEntity productsEntity;

  ProductItem({super.key, required this.productsEntity});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: 180,
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryColor,
              ),
              borderRadius: BorderRadius.circular(13)),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.195,
              ),
              Text(productsEntity.title ?? "",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 13,
                  )),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${productsEntity.price} EGP",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              ViewProductButton(textOfButton: 'View Product', onPressed: () {}),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.19,
          width: 180,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor, width: 1),
          ),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: productsEntity.imageCover ?? "",
          ),
        ),
      ]),
    );
  }
}
