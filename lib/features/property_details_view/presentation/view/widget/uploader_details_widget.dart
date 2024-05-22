import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hinvex_app/features/authentication/data/model/user_details_model.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:intl/intl.dart';

class UploaderDetails extends StatelessWidget {
  final PropertyModel propertyModel;
  final UserModel? userModel;
  const UploaderDetails({
    super.key,
    required this.propertyModel,
    this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    DateTime postDate = propertyModel.createDate!.toDate();
    String formattedDate = DateFormat('dd/MM/yyyy').format(postDate);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.containerColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            height: 103,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                        userModel == null
                            ? CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage(ImageConstant.adminprofile),
                              )
                            : CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    NetworkImage(userModel!.userImage!),
                              ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              userModel == null
                                  ? Row(
                                      children: [
                                        const Text(
                                          "Hinvex",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Gap(4),
                                        SizedBox(
                                          height: 16,
                                          width: 16,
                                          child: Image.asset(
                                              ImageConstant.bluetick),
                                        ),
                                      ],
                                    )
                                  : Text(
                                      userModel!.userName!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                              Text(
                                propertyModel.getSelectedListedByString,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              userModel == null
                                  ? const SizedBox()
                                  : Text(
                                      "Location; ${userModel!.userLocation!.localArea!}",
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
                                formattedDate,
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
