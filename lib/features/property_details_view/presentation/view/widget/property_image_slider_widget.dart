import 'package:flutter/material.dart';
import 'package:hinvex_app/features/property_details_view/presentation/view/widget/image_view_widget.dart';
import 'package:hinvex_app/general/utils/Customwidgets/CustomNetworkImageWidget.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';

class PropertyImageSlider extends StatelessWidget {
  final List propertyImages;
  final String? userId;

  const PropertyImageSlider({
    required this.propertyImages,
    required this.userId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: propertyImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle tap event
            },
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageViewWidget(
                            images: propertyImages,
                          ),
                        ));
                  },
                  child: CustomNetworkImageWidget(
                    imageUrl: propertyImages[index],
                    width: 308, // Adjust the width as needed
                    height: 210,
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 18,
                  child: Text(
                    "${index + 1}/${propertyImages.length}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                userId == 'owner'
                    ? Positioned(
                        top: 12,
                        left: 0,
                        child: SizedBox(
                          height: 17,
                          width: 85,
                          child: Image.asset(ImageConstant.assured),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          );
        },
      ),
    );
  }
}
