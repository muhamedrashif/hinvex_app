// import 'package:flutter/material.dart';
// import 'package:hinvex_app/general/utils/app_theme/colors.dart';

// class CustomAlertDialog extends StatelessWidget {
//   final String title;
//   final int itemCount;
//   final List<String> fields;
//   final Function(String)? onItemSelected;

//   const CustomAlertDialog({
//     super.key,
//     required this.title,
//     required this.itemCount,
//     required this.fields,
//     this.onItemSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: AppColors.backgroundColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       title: Text(
//         title,
//         style: const TextStyle(fontSize: 13),
//       ),
//       content: ListView.builder(
//         shrinkWrap: true,
//         itemCount: itemCount,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               if (onItemSelected != null && index < fields.length) {
//                 onItemSelected!(fields[index]);
//               }
//               Navigator.pop(context);
//             },
//             child: Container(
//               height: 44,
//               decoration: BoxDecoration(
//                 border: Border(
//                   bottom: index != itemCount - 1
//                       ? BorderSide(
//                           color: Colors.grey.shade400,
//                           width: 1.0,
//                         )
//                       : BorderSide.none,
//                 ),
//               ),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   fields.isNotEmpty && index < fields.length
//                       ? fields[index]
//                       : '',
//                   style: const TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 13,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//       actions: [
//         InkWell(
//           onTap: () {
//             if (onItemSelected != null) {
//               onItemSelected!('');
//             }
//             Navigator.pop(context);
//           },
//           child: Text(
//             'CANCEL',
//             style: TextStyle(
//               fontWeight: FontWeight.w600,
//               fontSize: 13,
//               color: AppColors.titleTextColor,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
