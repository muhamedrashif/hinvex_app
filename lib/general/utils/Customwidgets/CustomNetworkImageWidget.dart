import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;

  const CustomNetworkImageWidget({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          height: height,
          width: width,
          child: CachedNetworkImage(
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
                      image: AssetImage(ImageConstant.hinvexAppLogo),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              color: Colors.grey[300],
              child: const Center(
                child: Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 36,
                ),
              ),
            ),
            fit: BoxFit.cover,
            imageUrl: imageUrl,
          ),
        ),
      ),
    );
  }
}
