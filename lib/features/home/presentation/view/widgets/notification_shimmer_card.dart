import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

notificationShimmerCardWidget() {
  return SizedBox(
    height: 350,
    width: 700,
    child: Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 3, // Adjust the count based on your needs
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      height: 120,
                                      width: 120,
                                      // child: Transform.scale(
                                      //   scale: 1,
                                      //   child: Image.asset(
                                      //       ImageConstant.hinvexAppLogo),
                                      // ),
                                    ),
                                  ),
                                  Container(
                                    height: 15,
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                  ),
                                  const Gap(6),
                                  Container(
                                    height: 15,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                  ),
                                ]);
                          }),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}
