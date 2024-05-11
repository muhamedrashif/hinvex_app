// import 'package:flutter/material.dart';
// import 'package:hinvex_app/features/sell/presentation/provider/sell_provider.dart';
// import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';
// import 'package:provider/provider.dart';

// class DescribeInputWidget extends StatelessWidget {
//   final GlobalKey<FormState> formKey;
//   DescribeInputWidget({super.key, required this.formKey});
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<SellProvider>(builder: (context, state, _) {
//       return Form(
//         key: formKey,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Describe*",
//               style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 13,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 12.0),
//               child: CustomTextFormFieldWidget(
//                 hintText: "Describe About What you are selling",
//                 controller: state.describeController,
//                 maxLength: 4096,
//                 validator: (text) {
//                   if (text == null || text.isEmpty) {
//                     return 'Please Entre Describe';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(
//                 left: 8.0,
//                 bottom: 8,
//               ),
//               child: Text(
//                 "Encompassing condition, attributes, and rationale for sale",
//                 style: TextStyle(
//                     fontSize: 10,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.grey),
//               ),
//             )
//           ],
//         ),
//       );
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/provider/sell_provider.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';
import 'package:provider/provider.dart';

class DescribeInputWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const DescribeInputWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Consumer<SellProvider>(builder: (context, state, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Describe*",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: CustomTextFormFieldWidget(
              hintText: "Describe About What you are selling",
              controller: state.describeController,
              maxLength: 4096,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Please Enter Description';
                }
                return null;
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 8.0,
              bottom: 8,
            ),
            child: Text(
              "Encompassing condition, attributes, and rationale for sale",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      );
    });
  }
}
