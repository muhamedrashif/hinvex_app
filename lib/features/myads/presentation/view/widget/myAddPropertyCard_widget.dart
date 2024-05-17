import 'package:flutter/material.dart';
import 'package:hinvex_app/features/myads/presentation/view/widget/deletePopup_widget.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/screens/property_uploading_screen.dart';
import 'package:hinvex_app/general/utils/Customwidgets/CustomNetworkImageWidget.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:intl/intl.dart';

class MyAddPropertyCardWidget extends StatelessWidget {
  final PropertyModel propertyModel;
  const MyAddPropertyCardWidget({super.key, required this.propertyModel});

  @override
  Widget build(BuildContext context) {
    DateTime postDate = propertyModel.createDate!.toDate();
    String formattedDate = DateFormat('MM/dd/yyyy').format(postDate);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
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
                height: 93,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                              width: 80,
                              child: Text(
                                "POSTED",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              )),
                          Text(
                            formattedDate,
                            style: const TextStyle(
                              fontSize: 11,
                            ),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 80,
                                child: Text(
                                  "VIEWS",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                )),
                            Text(
                              "321",
                              style: TextStyle(
                                fontSize: 11,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Row(
                        children: [
                          SizedBox(
                              width: 80,
                              child: Text(
                                "LIKES",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              )),
                          Text(
                            "23",
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PopupMenuButton(
                      color: AppColors.backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      splashRadius: 20,
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            height: 30,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PropertyUploadingScreen(
                                      categoryName: propertyModel
                                          .getSelectedCategoryString,
                                      propertyModel: propertyModel,
                                    ),
                                  ));
                            },
                            child: const Text("Edit"),
                          ),
                          PopupMenuItem(
                            height: 30,
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return DeletePostConfirmationDialog(
                                      postId: propertyModel.id.toString());
                                },
                              );
                            },
                            child: const Text("Remove"),
                          ),
                        ];
                      },
                    ),
                  ))
            ],
          ),
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        left: 16,
                        right: 16,
                      ),
                      child: SizedBox(
                        height: 156, // Adjust the height as needed
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: propertyModel.propertyImage!.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                CustomNetworkImageWidget(
                                  imageUrl: propertyModel.propertyImage![index],
                                  width: 228, // Adjust the width as needed
                                  height: 156,
                                ),
                                Positioned(
                                  top: 12,
                                  right: 18,
                                  child: Text(
                                    "${index + 1}/${propertyModel.propertyImage!.length}",
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
                            "\u{20B9} ${propertyModel.propertyPrice}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.titleTextColor),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            propertyModel.propertyTitle.toString().length > 43
                                ? '${propertyModel.propertyTitle.toString().substring(0, 43)}...'
                                : propertyModel.propertyTitle.toString(),
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            propertyModel.propertyDetils.toString().length > 55
                                ? '${propertyModel.propertyDetils.toString().substring(0, 55)}...'
                                : propertyModel.propertyDetils.toString(),
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${propertyModel.propertyLocation!.localArea.toString()}, ${propertyModel.propertyLocation!.district.toString()}',
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
        ],
      ),
    );
  }
}
