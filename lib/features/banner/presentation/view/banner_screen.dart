import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:hinvex_app/features/banner/data/model/banner_model.dart';
import 'package:hinvex_app/general/utils/Customwidgets/CustomNetworkImageWidget.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';

import 'widget/customslideindicator.dart';

class BannerCarouselWidget extends StatefulWidget {
  final List<BannerModel>? bannerList;
  const BannerCarouselWidget({super.key, this.bannerList});

  @override
  State<BannerCarouselWidget> createState() => _BannerCarouselWidgetState();
}

class _BannerCarouselWidgetState extends State<BannerCarouselWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider.builder(
            viewportFraction: 1,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            scrollPhysics: const BouncingScrollPhysics(),
            autoSliderTransitionCurve: Curves.decelerate,
            itemCount: widget.bannerList!.length,
            slideBuilder: (index) {
              return CustomNetworkImageWidget(
                imageUrl: widget.bannerList![index].image,
                width: MediaQuery.of(context).size.width,
                height: 200,
              );
            },
            onSlideChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: CustomSlideIndicator(
              itemCount: widget.bannerList!.length,
              currentIndex: _currentIndex,
              selectedColor: AppColors.backgroundColor,
              unselectedColor: AppColors.titleTextColor,
              selectedBorderColor: AppColors.titleTextColor,
              unselectedBorderColor: AppColors.backgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
