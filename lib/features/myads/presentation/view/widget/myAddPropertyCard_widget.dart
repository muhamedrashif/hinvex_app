import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hinvex_app/features/authentication/presentation/provider/auth_provider.dart';
import 'package:hinvex_app/features/authentication/presentation/view/authentocation_screen.dart';
import 'package:hinvex_app/features/myads/presentation/view/widget/deletePopup_widget.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/screens/property_uploading_screen.dart';
import 'package:hinvex_app/features/shortlists/presentation/provider/shortlist_provider.dart';
import 'package:hinvex_app/general/utils/Customwidgets/CustomNetworkImageWidget.dart';
import 'package:hinvex_app/general/utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MyAddPropertyCardWidget extends StatelessWidget {
  final PropertyModel propertyModel;
  const MyAddPropertyCardWidget({super.key, required this.propertyModel});

  @override
  Widget build(BuildContext context) {
    DateTime postDate = propertyModel.createDate!.toDate();
    String formattedDate = DateFormat('dd/MM/yyyy').format(postDate);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                // height: 93,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                      const Gap(8),
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
                  mainAxisSize: MainAxisSize.min,
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
                                  width: propertyModel.propertyImage!.length ==
                                          1
                                      ? MediaQuery.of(context).size.width / 1.23
                                      : 228,
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
                            propertyModel.propertyTitle.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            propertyModel.propertyDetils.toString(),
                            overflow: TextOverflow.ellipsis,
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
              Positioned(
                top: 28,
                right: 22,
                child: Consumer<AuthenticationProvider>(
                  builder: (context, state, child) {
                    return InkWell(
                      onTap: () {
                        if (FirebaseAuth.instance.currentUser != null) {
                          Provider.of<ShortListProvider>(context, listen: false)
                              .uploadShortList(propertyModel, state.userModel!);
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AuthenticationScreen(),
                              ));
                        }
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white54,
                        child: Icon(
                          state.userModel!.favoriteProducts!
                                  .contains(propertyModel.id)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 20,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
