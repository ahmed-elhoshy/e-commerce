import 'package:cached_network_image/cached_network_image.dart';
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
          width: 180,
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryColor,
              ),
              borderRadius: BorderRadius.circular(13)),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.185,
                ),
                Text(productsEntity.title ?? "",
                    style: TextStyle(
                      color: AppColors.black,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 13,
                    )),
                Text(
                  "EGP ${productsEntity.price}",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 14,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Review (${productsEntity.ratingsAverage})",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 13,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.add_circle,
                        color: AppColors.primaryColor,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.18,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(14), topLeft: Radius.circular(14)),
            border: Border.all(color: AppColors.primaryColor, width: 1),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: productsEntity.imageCover ?? "",
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.35,
              top: MediaQuery.of(context).size.height * 0.01),
          child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.white),
              child: Icon(
                Icons.favorite_border,
                color: AppColors.primaryColor,
              )),
        )
      ]),
    );
  }
}
