import 'package:flutter/material.dart';
import 'package:hinvex_app/general/utils/Customwidgets/CustomNetworkImageWidget.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';

class CategoryCardItems extends StatelessWidget {
  const CategoryCardItems({
    super.key,
    required this.count,
    required this.price,
    required this.title,
    required this.details,
    required this.location,
    required this.uploaderName,
    required this.uploaderCategory,
    required this.uploaderLocation,
    required this.uploadedDate, required this.image,
  });

  final int count;
  final String price;
  final String title;
  final String details;
  final String location;
  final String uploaderName;
  final String uploaderCategory;
  final String uploaderLocation;
  final String uploadedDate;
  final List image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5,right: 5),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 2,
                      spreadRadius: 1,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 9.0,
                        left: 12,
                        right: 12,
                      ),
                      child: SizedBox(
                        height: 180, // Adjust the height as needed
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: count,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                 CustomNetworkImageWidget(
                                  imageUrl: image[index],
                                  width:count==1?275:228, // Adjust the width as needed
                                  height: 180,
                                ),
                                Positioned(
                                  top: 12,
                                  right: 18,
                                  child: Text(
                                    "${index + 1}/$count",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 16.0,
                        left: 16,
                        right: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\u{20B9} $price",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.titleTextColor),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            details,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            location,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Positioned(
                top: 28,
                right: 22,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white54,
                  child: Icon(
                    Icons.favorite,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 3,
                  spreadRadius: 3,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Uploader Detail",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.titleTextColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              AssetImage(ImageConstant.defaultProfile),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                uploaderName,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                uploaderCategory,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                uploaderLocation,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "POSTED",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                uploadedDate,
                                style: const TextStyle(
                                  fontSize: 10,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
