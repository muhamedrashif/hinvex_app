import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_image_widget.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:hinvex_app/general/utils/shimmer/shimmer.dart';
import 'package:shimmer/shimmer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              // backgroundColor: AppColors.backgroundColor,
              iconTheme: IconThemeData(color: AppColors.titleTextColor),
              title: Text(
                "Notification",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.titleTextColor,
                ),
              ),
            ),
            SliverList.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade200,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        placeholder: (context, url) => SizedBox(
                          width: 220.0,
                          height: 120.0,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 220,
                              width: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    ImageConstant.hinvexAppLogo,
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error), // Placeholder for error
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://example.com/image.jpg", // Replace with your actual URL
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(10),
                      //     child: SizedBox(
                      //       height: 70,
                      //       width: 80,
                      //       child: CachedNetworkImage(
                      //         placeholder: (context, url) => SizedBox(
                      //           width: 220.0,
                      //           height: 120.0,
                      //           child: Shimmer.fromColors(
                      //             baseColor: Colors.grey[300]!,
                      //             highlightColor: Colors.grey[100]!,
                      //             child: Container(
                      //               height: 220,
                      //               width: 120,
                      //               decoration: BoxDecoration(
                      //                 image: DecorationImage(
                      //                   image: AssetImage(
                      //                     ImageConstant.hinvexAppLogo,
                      //                   ),
                      //                   fit: BoxFit.contain,
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         fit: BoxFit.cover,
                      //         imageUrl:
                      //             "https://media.istockphoto.com/id/1351228295/photo/boy-having-fun-on-the-water-slide.jpg?s=612x612&w=0&k=20&c=b3URBZLrWUQlWlMDk_jtRAUYMgKWU8OvLafuWnjPiv0=",
                      //       ),
                      //       // child: Image.network(
                      //       //   state.suggestions[index]
                      //       //       .propertyImage![0],
                      //       //   fit: BoxFit.cover,
                      //       // ),
                      //     ),
                      //   ),
                      // ),
                      // CustomNetworkImageWidget(
                      //     imageUrl:
                      //         "https://media.istockphoto.com/id/1351228295/photo/boy-having-fun-on-the-water-slide.jpg?s=612x612&w=0&k=20&c=b3URBZLrWUQlWlMDk_jtRAUYMgKWU8OvLafuWnjPiv0="),
                      // Align(
                      //   alignment: Alignment.center,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(20.0),
                      //     child: SizedBox(
                      //       height: 75,
                      //       width: 75,
                      //       child: Image.network(
                      //         "https://media.istockphoto.com/id/2148278888/photo/indian-girl-having-fun-playing-on-slip-n-slide.jpg?s=612x612&w=0&k=20&c=54iKqUJ9KwnL9ahOQKQ-4_Ja_7abkiX-u1vbwYFpYG4=",
                      //         fit: BoxFit.contain,
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Notification",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 8.0,
                                  right: 10,
                                ),
                                child: Text(
                                  "We’re pleased to introduce the latest enhancements in our templating experience.",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
// body: SafeArea(
//   child: CustomScrollView(
//     slivers: [
//       SliverToBoxAdapter(
//           child: Column(
//         children: [
//           SliverList.builder(
//             itemCount: 3,
//             itemBuilder: (context, index) {
//               return Text("data");
//             },
//           )
//         ],
//       )),
//     ],
//   ),
// child: Center(
//   child: Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 88.0, bottom: 8),
//           child: CustumImage(
//             image: ImageConstant.defaultNotification,
//             height: 177.87,
//             width: 150,
//             alignment: Alignment.topLeft,
//           ),
//         ),
//         Text(
//           "No notifications received at the\n  moment, providing a tranquil\n                   interface.",
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w600,
//             color: AppColors.titleTextColor,
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
//       ),
//     );
//   }
// }
