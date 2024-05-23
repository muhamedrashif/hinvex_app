import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hinvex_app/features/authentication/presentation/provider/auth_provider.dart';
import 'package:hinvex_app/features/authentication/presentation/view/authentocation_screen.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/features/shortlists/presentation/provider/shortlist_provider.dart';
import 'package:hinvex_app/general/utils/Customwidgets/CustomNetworkImageWidget.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:provider/provider.dart';

class PropertyCardItems extends StatelessWidget {
  const PropertyCardItems({
    super.key,
    required this.postModel,
  });
  final PropertyModel postModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 10,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(16),
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
                    SizedBox(
                      height: 180, // Adjust the height as needed
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: postModel.propertyImage?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              CustomNetworkImageWidget(
                                imageUrl: postModel.propertyImage?[index] ?? "",
                                width: postModel.propertyImage?.length == 1
                                    ? 292
                                    : 228, // Adjust the width as needed
                                height: 180,
                              ),
                              Positioned(
                                top: 12,
                                right: 18,
                                child: Text(
                                  "${index + 1}/${postModel.propertyImage?.length}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              postModel.userId == 'owner'
                                  ? Positioned(
                                      top: 12,
                                      left: 0,
                                      child: SizedBox(
                                        height: 17,
                                        width: 85,
                                        child:
                                            Image.asset(ImageConstant.assured),
                                      ),
                                    )
                                  : const SizedBox()
                            ],
                          );
                        },
                      ),
                    ),
                    const Gap(5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "₹ ${postModel.propertyPrice.toString()}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColors.titleTextColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          postModel.propertyTitle ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          postModel.propertyDetils ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${postModel.propertyLocation?.localArea}, ${postModel.propertyLocation?.district}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
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
                              .uploadShortList(postModel, state.userModel!);
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
                                  .contains(postModel.id)
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
