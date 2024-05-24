import 'package:flutter/material.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_image_widget.dart';
import 'package:hinvex_app/general/utils/image_constants.dart';
import 'package:hinvex_app/general/utils/colors.dart';
import 'package:hinvex_app/general/utils/enums/enums.dart';

// ignore: must_be_immutable
class TabBarWidget extends StatelessWidget {
  TabBarWidget({super.key});

  List<Map<String, dynamic>> categories = [
    {
      "name": "All",
    },
    {
      "image": ImageConstant.house,
      "name": "House",
      "category": SelectedCategory.house
    },
    {
      "image": ImageConstant.appartment,
      "name": "Apartments",
      "category": SelectedCategory.apartments
    },
    {
      "image": ImageConstant.landplot,
      "name": "Lands/Plots",
      "category": SelectedCategory.landsPlots
    },
    {
      "image": ImageConstant.commertial,
      "name": "Commercial",
      "category": SelectedCategory.commercial
    },
    {
      "image": ImageConstant.cowork,
      "name": "Co-Working Space",
      "category": SelectedCategory.coWorkingSpace
    },
    {
      "image": ImageConstant.pgguestHouse,
      "name": "PG & Guest House",
      "category": SelectedCategory.pGGuestHouse
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.titleTextColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    categories[index]["image"] == null
                        ? const SizedBox()
                        : CustumImage(
                            image: categories[index]["image"],
                            height: 18,
                            width: 18,
                          ),
                    Padding(
                      padding: categories[index]["image"] == null
                          ? const EdgeInsets.all(8)
                          : const EdgeInsets.only(
                              bottom: 8.0, right: 8, top: 8),
                      child: Text(
                        categories[index]["name"],
                        style: TextStyle(
                          color: AppColors.titleTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
