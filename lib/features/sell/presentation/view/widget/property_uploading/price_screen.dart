// import 'package:flutter/material.dart';
// import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_button_widget.dart';
// import 'package:hinvex_app/general/utils/app_theme/colors.dart';
// import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';

// class PriceScreen extends StatefulWidget {
//   const PriceScreen({super.key});

//   @override
//   State<PriceScreen> createState() => _PriceScreenState();
// }

// class _PriceScreenState extends State<PriceScreen> {
//   final TextEditingController _priceController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: AppColors.backgroundColor,
//         appBar: AppBar(
//           backgroundColor: AppColors.backgroundColor,
//           iconTheme: IconThemeData(color: AppColors.titleTextColor),
//           title: Text(
//             "Set A Price",
//             style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: AppColors.titleTextColor),
//           ),
//         ),
//         body: CustomScrollView(slivers: [
//           SliverToBoxAdapter(
//               child: SafeArea(
//             child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Define Your Price*",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 13,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 12.0),
//                       child: CustomTextFormFieldWidget(
//                         hintText: "Enter Here",
//                         controller: _priceController,
//                         keyboardType: TextInputType.number,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8.0),
//                       child: CustomButtonWidget(
//                         height: 44,
//                         width: MediaQuery.of(context).size.width,
//                         buttonColor: AppColors.textButtonColor,
//                         text: "Next",
//                         textColor: AppColors.buttonTextColor,
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => PriceScreen(),
//                               ));
//                         },
//                       ),
//                     ),
//                   ],
//                 )),
//           ))
//         ]));
//   }
// }

import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/view/widget/property_uploading/user_profile_screen.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_button_widget.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        iconTheme: IconThemeData(color: AppColors.titleTextColor),
        title: Text(
          "Set A Price",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.titleTextColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Define Your Price*",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: CustomTextFormFieldWidget(
                              hintText: "Enter Here",
                              controller: _priceController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomButtonWidget(
              height: 44,
              width: MediaQuery.of(context).size.width,
              buttonColor: AppColors.textButtonColor,
              text: "Next",
              textColor: AppColors.buttonTextColor,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfileScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
