import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Domain/entities/CategoryEntity.dart';
import 'categoryItem.dart';

class CategorySection extends StatelessWidget {
  List<CategoryOrBrandEntity> categoriesList;

  CategorySection({required this.categoriesList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      child: GridView.builder(
          itemCount: categoriesList.length,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 0,
          ),
          itemBuilder: (context, index) {
            return Categoryitem(categoryEntity: categoriesList[index]);
          }),
    );
  }
}
