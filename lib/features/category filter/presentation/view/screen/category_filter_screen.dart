import 'package:flutter/material.dart';
import 'package:hinvex_app/features/category%20filter/presentation/provider/category_filter_provider.dart';
import 'package:hinvex_app/features/category%20filter/presentation/view/widget/bedroom_widget.dart';
import 'package:hinvex_app/features/category%20filter/presentation/view/widget/budget_slider.dart';
import 'package:hinvex_app/features/category%20filter/presentation/view/widget/buy_rent_widget.dart';
import 'package:hinvex_app/features/category%20filter/presentation/view/widget/furnishing_widget.dart';
import 'package:hinvex_app/features/category%20filter/presentation/view/widget/listedby_widget.dart';
import 'package:hinvex_app/features/category%20filter/presentation/view/widget/sqft_price.dart';
import 'package:hinvex_app/features/category%20filter/presentation/view/widget/status_widget.dart';
import 'package:hinvex_app/features/category/presentation/view/screen/category_display_screen.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:provider/provider.dart';

class CategoryFilterScreen extends StatefulWidget {
  const CategoryFilterScreen({super.key});

  @override
  State<CategoryFilterScreen> createState() => _CategoryFilterScreenState();
}

class _CategoryFilterScreenState extends State<CategoryFilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.backgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.primaryColor,
            )),
        title: Text(
          "Properties",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>const CategoryDisplayScreen(),));
            },
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text(
                  "View Properties",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColors.backgroundColor,
                  ),
                ),
              ),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Consumer<CategoryFilterProvider>(
            builder: (context, state, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Im Looking to",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  BuyRentWidget(
                    onTap: (value) {
                      state.isBuyTapped(value);
                    },
                    value: state.isBuy,
                  ),
                  Text(
                    "Bedroom",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  BedRoomWidget(
                      onTap: (value) {
                        state.isBedroonTapped(value);
                      },
                      value: state.bedroomCount),
                  Text(
                    "Furnishing",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: FurnishingWidget(
                        onTap: (value) {
                          state.isFurnishingTapped(value);
                        },
                        value: state.furnishingCount),
                  ),
                  BudgetSlider(
                      currentSliderValue: state.budgetSliderValue ?? 0,
                      maxLength: 500000000,
                      onChanged: (value) {
                        state.isBudgetTapped(value);
                      }),
                  Text(
                    "Listed By",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ListedByWidget(
                      onTap: (value) {
                        state.isListedByTapped(value);
                      },
                      value: state.listedByCount),
                  Text(
                    "Construction Status",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: StatusWidget(
                        onTap: (value) {
                          state.isStatusTapped(value);
                        },
                        value: state.statusCount),
                  ),
                  SqftPriceSlider(
                      currentSliderValue: state.sqPriceSliderValue ?? 0,
                      maxLength: 100000,
                      onChanged: (value) {
                        state.isSqPriceTapped(value);
                      }),
                  const SizedBox(
                    height: 100,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
