import 'package:e_commerce/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlideShow extends StatelessWidget {
  List<String> sliderImages = [
    'assets/images/ad_one.png',
    'assets/images/ad_two.png',
    'assets/images/ad_three.png',
  ];

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      initialPage: 0,
      indicatorBackgroundColor: AppColors.white,
      indicatorColor: AppColors.primaryColor,
      isLoop: true,
      autoPlayInterval: 3000,
      indicatorBottomPadding: 25.h,
      children: sliderImages
          .map((url) => Padding(
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  url,
                  fit: BoxFit.fill,
                  width: 396.w,
                  height: 200.h,
                ),
              ))
          .toList(),
    );
  }
}
