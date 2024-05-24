import 'package:flutter/material.dart';
import 'package:hinvex_app/general/utils/image_constants.dart';
import 'package:shimmer/shimmer.dart';

class BannerShimmerWidget extends StatelessWidget {
  const BannerShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            height: 120,
            width: 120,
            child: Transform.scale(
              scale: .4,
              child: Image.asset(ImageConstant.hinvexAppLogo),
            ),
          ),
        ));
  }
}
