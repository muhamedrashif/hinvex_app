import 'package:flutter/material.dart';
import 'package:hinvex_app/features/category/presentation/view/location_search_screen.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_image_widget.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';

class CategoryContainerWidget extends StatefulWidget {
  const CategoryContainerWidget({super.key});

  @override
  State<CategoryContainerWidget> createState() =>
      _CategoryContainerWidgetState();
}

class _CategoryContainerWidgetState extends State<CategoryContainerWidget> {
  List<Map<String, dynamic>> categories = [
    {"image": ImageConstant.house, "name": "Houses"},
    {"image": ImageConstant.appartment, "name": "Apartments"},
    {"image": ImageConstant.landplot, "name": "Land And Plot"},
    {"image": ImageConstant.commertial, "name": "Commercial"},
    {"image": ImageConstant.cowork, "name": "Co-Working\nSpace"},
    {"image": ImageConstant.pgguestHouse, "name": "PG & Guest\nHouse"},
  ];
  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width / 2;
    double itemHeight = 80.0;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.5,
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const SearchLocationScreen(),
                //   ),
                // );
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: itemWidth,
                    maxHeight: itemHeight,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: CustumImage(
                          image: categories[index]["image"],
                          height: 32,
                          width: 32,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          categories[index]["name"],
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: AppColors.titleTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
