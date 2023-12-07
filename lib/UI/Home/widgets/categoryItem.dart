import 'package:e_commerce/Domain/entities/CategoryEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utils/app_colors.dart';

class Categoryitem extends StatelessWidget {
  CategoryOrBrandEntity categoryEntity;

  Categoryitem({required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CircleAvatar(
            backgroundImage: NetworkImage(categoryEntity.image ?? ''),
            radius: 50.r,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          categoryEntity.name ?? " ",
          textWidthBasis: TextWidthBasis.longestLine,
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.navyTextColor, fontSize: 15),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
