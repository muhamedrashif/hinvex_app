// import 'package:flutter/material.dart';
// import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/screens/property_uploading_screen.dart';
// import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_image_widget.dart';
// import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
// import 'package:hinvex_app/general/utils/app_theme/colors.dart';

// class SellContainerWidget extends StatefulWidget {
//   const SellContainerWidget({super.key});

//   @override
//   State<SellContainerWidget> createState() => _SellContainerWidgetState();
// }

// class _SellContainerWidgetState extends State<SellContainerWidget> {
//   List<Map<String, dynamic>> categories = [
//     {"image": ImageConstant.sellhouse, "name": "House"},
//     {"image": ImageConstant.sellapartment, "name": "Apartments"},
//     {"image": ImageConstant.sellland, "name": "Lands/Plots"},
//     {"image": ImageConstant.sellcommertial, "name": "Commercial"},
//     {"image": ImageConstant.sellcowork, "name": "Co-Working Space"},
//     {"image": ImageConstant.sellpgguesthouse, "name": "PG & Guest House"},
//   ];
//   @override
//   Widget build(BuildContext context) {
//     double itemWidth = MediaQuery.of(context).size.width / 2;
//     double itemHeight = 50.0;
//     return Padding(
//       padding: const EdgeInsets.all(4.0),
//       child: SizedBox(
//         height: MediaQuery.of(context).size.height / 1.5,
//         child: ListView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: 6,
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => PropertyUploadingScreen(
//                         categoryName: categories[index]["name"],
//                       ),
//                     ));
//               },
//               child: Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: Container(
//                   constraints: BoxConstraints(
//                     maxWidth: itemWidth,
//                     maxHeight: itemHeight,
//                   ),
//                   decoration: BoxDecoration(
//                     border: Border(
//                       bottom: BorderSide(
//                         color: Colors.grey.shade300,
//                         width: 1.0,
//                         style: BorderStyle.solid,
//                       ),
//                     ),
//                     color: Colors.white,
//                   ),
//                   child: Row(
//                     children: [
//                       CustumImage(
//                         image: categories[index]["image"],
//                         height: 24,
//                         width: 24,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           categories[index]["name"],
//                           style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 14,
//                             color: AppColors.titleTextColor,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/provider/sell_provider.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/screens/property_uploading_screen.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_image_widget.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:hinvex_app/general/utils/enums/enums.dart';
import 'package:provider/provider.dart';

class SellContainerWidget extends StatefulWidget {
  const SellContainerWidget({super.key});

  @override
  State<SellContainerWidget> createState() => _SellContainerWidgetState();
}

class _SellContainerWidgetState extends State<SellContainerWidget> {
  List<Map<String, dynamic>> categories = [
    {
      "image": ImageConstant.sellhouse,
      "name": "House",
      "category": SelectedCategory.house
    },
    {
      "image": ImageConstant.sellapartment,
      "name": "Apartments",
      "category": SelectedCategory.apartments
    },
    {
      "image": ImageConstant.sellland,
      "name": "Lands/Plots",
      "category": SelectedCategory.landsPlots
    },
    {
      "image": ImageConstant.sellcommertial,
      "name": "Commercial",
      "category": SelectedCategory.commercial
    },
    {
      "image": ImageConstant.sellcowork,
      "name": "Co-Working Space",
      "category": SelectedCategory.coWorkingSpace
    },
    {
      "image": ImageConstant.sellpgguesthouse,
      "name": "PG & Guest House",
      "category": SelectedCategory.pGGuestHouse
    },
  ];

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width / 2;
    double itemHeight = 50.0;
    return Consumer<SellProvider>(builder: (context, state, _) {
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
                  setState(() {
                    state.selectedCategory = categories[index]["category"];
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PropertyUploadingScreen(
                          categoryName: categories[index]["name"],
                          selectedCategory: state.selectedCategory!,
                        ),
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
    });
  }
}
