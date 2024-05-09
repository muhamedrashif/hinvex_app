import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/view/property_uploading_screen.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_image_widget.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';

class SellContainerWidget extends StatefulWidget {
  const SellContainerWidget({super.key});

  @override
  State<SellContainerWidget> createState() => _SellContainerWidgetState();
}

class _SellContainerWidgetState extends State<SellContainerWidget> {
  List<Map<String, dynamic>> categories = [
    {"image": ImageConstant.sellhouse, "name": "Houses"},
    {"image": ImageConstant.sellapartment, "name": "Apartments"},
    {"image": ImageConstant.sellland, "name": "Land And Plot"},
    {"image": ImageConstant.sellcommertial, "name": "Commercial"},
    {"image": ImageConstant.sellcowork, "name": "Co-Working\nSpace"},
    {"image": ImageConstant.sellpgguesthouse, "name": "PG & Guest\nHouse"},
  ];
  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width / 2;
    double itemHeight = 50.0;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.5,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PropertyUploadingScreen(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: itemWidth,
                    maxHeight: itemHeight,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      CustumImage(
                        image: categories[index]["image"],
                        height: 24,
                        width: 24,
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
