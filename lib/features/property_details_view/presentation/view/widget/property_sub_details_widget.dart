import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';

class PropertySubDetails extends StatelessWidget {
  final PropertyModel propertyModel;
  const PropertySubDetails({
    super.key,
    required this.propertyModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Details",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.titleTextColor),
        ),
        /////////////////////////////////////////////////////////////////////////////////////////////////////////
        if (propertyModel.getSelectedTypeString.isEmpty)
          const SizedBox()
        else
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 8),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 14,
                        width: 14,
                        child: Image.asset(ImageConstant.detailtype),
                      ),
                      const Gap(8),
                      Text(
                        "TYPE",
                        style: TextStyle(
                            color: AppColors.titleTextColor, fontSize: 11),
                      )
                    ],
                  ),
                ),
                Text(
                  propertyModel.getSelectedTypeString,
                  style: TextStyle(
                      color: AppColors.titleTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),

        /////////////////////////////////////////////////////////////////////////////////////////////////////////

        if (propertyModel.bathRooms == 0)
          const SizedBox()
        else
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 14,
                        width: 14,
                        child: Image.asset(ImageConstant.detailbathroom),
                      ),
                      const Gap(8),
                      Text(
                        "BATHROOM",
                        style: TextStyle(
                            color: AppColors.titleTextColor, fontSize: 11),
                      )
                    ],
                  ),
                ),
                Text(
                  propertyModel.bathRooms.toString(),
                  style: TextStyle(
                      color: AppColors.titleTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        /////////////////////////////////////////////////////////////////////////////////////////////////////////

        if (propertyModel.bedRooms == 0)
          const SizedBox()
        else
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 14,
                        width: 14,
                        child: Image.asset(ImageConstant.detailbedroom),
                      ),
                      const Gap(8),
                      Text(
                        "BEDROOM",
                        style: TextStyle(
                            color: AppColors.titleTextColor, fontSize: 11),
                      )
                    ],
                  ),
                ),
                Text(
                  propertyModel.bedRooms.toString(),
                  style: TextStyle(
                      color: AppColors.titleTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        /////////////////////////////////////////////////////////////////////////////////////////////////////////

        if (propertyModel.washRoom == 0)
          const SizedBox()
        else
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 14,
                        width: 14,
                        child: Image.asset(ImageConstant.detailwashroom),
                      ),
                      const Gap(8),
                      Text(
                        "WASHROOM",
                        style: TextStyle(
                            color: AppColors.titleTextColor, fontSize: 11),
                      )
                    ],
                  ),
                ),
                Text(
                  propertyModel.washRoom.toString(),
                  style: TextStyle(
                      color: AppColors.titleTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        /////////////////////////////////////////////////////////////////////////////////////////////////////////

        if (propertyModel.getSelectedListedByString.isEmpty)
          const SizedBox()
        else
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 14,
                        width: 14,
                        child: Image.asset(ImageConstant.detaillistedby),
                      ),
                      const Gap(8),
                      Text(
                        "LISTED BY",
                        style: TextStyle(
                            color: AppColors.titleTextColor, fontSize: 11),
                      )
                    ],
                  ),
                ),
                Text(
                  propertyModel.getSelectedListedByString,
                  style: TextStyle(
                      color: AppColors.titleTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ), /////////////////////////////////////////////////////////////////////////////////////////////////////////

        if (propertyModel.getSelectedFurnisherString.isEmpty)
          const SizedBox()
        else
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 14,
                        width: 14,
                        child: Image.asset(ImageConstant.detailfurnishing),
                      ),
                      const Gap(8),
                      Text(
                        "FURNISHING",
                        style: TextStyle(
                            color: AppColors.titleTextColor, fontSize: 11),
                      )
                    ],
                  ),
                ),
                Text(
                  propertyModel.getSelectedFurnisherString,
                  style: TextStyle(
                      color: AppColors.titleTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ), /////////////////////////////////////////////////////////////////////////////////////////////////////////

        if (propertyModel.getConstructionStatusString.isEmpty)
          const SizedBox()
        else
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 14,
                        width: 14,
                        child:
                            Image.asset(ImageConstant.detailcunstructionstatus),
                      ),
                      const Gap(8),
                      Text(
                        "CONSTRUCTUION STATUS",
                        style: TextStyle(
                            color: AppColors.titleTextColor, fontSize: 11),
                      )
                    ],
                  ),
                ),
                Text(
                  propertyModel.getConstructionStatusString,
                  style: TextStyle(
                      color: AppColors.titleTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ), /////////////////////////////////////////////////////////////////////////////////////////////////////////

        if (propertyModel.superBuiltupAreaft == 0)
          const SizedBox()
        else
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 14,
                        width: 14,
                        child:
                            Image.asset(ImageConstant.detailsuperbuiltuparea),
                      ),
                      const Gap(8),
                      Text(
                        "SUPER BUILTUP AREA (FT2)",
                        style: TextStyle(
                            color: AppColors.titleTextColor, fontSize: 11),
                      )
                    ],
                  ),
                ),
                Text(
                  propertyModel.superBuiltupAreaft.toString(),
                  style: TextStyle(
                      color: AppColors.titleTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ), /////////////////////////////////////////////////////////////////////////////////////////////////////////

        if (propertyModel.carpetAreaft == 0)
          const SizedBox()
        else
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 14,
                        width: 14,
                        child: Image.asset(ImageConstant.detailcarpetarea),
                      ),
                      const Gap(8),
                      Text(
                        "CARPET AREA (FT2)",
                        style: TextStyle(
                            color: AppColors.titleTextColor, fontSize: 11),
                      )
                    ],
                  ),
                ),
                Text(
                  propertyModel.carpetAreaft.toString(),
                  style: TextStyle(
                      color: AppColors.titleTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ), /////////////////////////////////////////////////////////////////////////////////////////////////////////

        if (propertyModel.plotArea == 0)
          const SizedBox()
        else
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 14,
                        width: 14,
                        child: Image.asset(ImageConstant.detailplotarea),
                      ),
                      const Gap(8),
                      Text(
                        "PLOT AREA",
                        style: TextStyle(
                            color: AppColors.titleTextColor, fontSize: 11),
                      )
                    ],
                  ),
                ),
                Text(
                  propertyModel.plotArea.toString(),
                  style: TextStyle(
                      color: AppColors.titleTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ), /////////////////////////////////////////////////////////////////////////////////////////////////////////

        if (propertyModel.plotLength == 0)
          const SizedBox()
        else
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 14,
                        width: 14,
                        child: Image.asset(ImageConstant.detaillength),
                      ),
                      const Gap(8),
                      Text(
                        "LENGTH",
                        style: TextStyle(
                            color: AppColors.titleTextColor, fontSize: 11),
                      )
                    ],
                  ),
                ),
                Text(
                  propertyModel.plotLength.toString(),
                  style: TextStyle(
                      color: AppColors.titleTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ), /////////////////////////////////////////////////////////////////////////////////////////////////////////

        if (propertyModel.plotBreadth == 0)
          const SizedBox()
        else
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 14,
                        width: 14,
                        child: Image.asset(ImageConstant.detailbreadth),
                      ),
                      const Gap(8),
                      Text(
                        "BREADTH",
                        style: TextStyle(
                            color: AppColors.titleTextColor, fontSize: 11),
                      )
                    ],
                  ),
                ),
                Text(
                  propertyModel.plotBreadth.toString(),
                  style: TextStyle(
                      color: AppColors.titleTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ), /////////////////////////////////////////////////////////////////////////////////////////////////////////

        if (propertyModel.totalFloors == 0)
          const SizedBox()
        else
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 14,
                        width: 14,
                        child: Image.asset(ImageConstant.detailtotalfloor),
                      ),
                      const Gap(8),
                      Text(
                        "TOTAL FLOOR",
                        style: TextStyle(
                            color: AppColors.titleTextColor, fontSize: 11),
                      )
                    ],
                  ),
                ),
                Text(
                  propertyModel.totalFloors.toString(),
                  style: TextStyle(
                      color: AppColors.titleTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ), /////////////////////////////////////////////////////////////////////////////////////////////////////////

        if (propertyModel.floorNo == 0)
          const SizedBox()
        else
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 14,
                        width: 14,
                        child: Image.asset(ImageConstant.detailfloorno),
                      ),
                      const Gap(8),
                      Text(
                        "FLOOR NO.",
                        style: TextStyle(
                            color: AppColors.titleTextColor, fontSize: 11),
                      )
                    ],
                  ),
                ),
                Text(
                  propertyModel.floorNo.toString(),
                  style: TextStyle(
                      color: AppColors.titleTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ), /////////////////////////////////////////////////////////////////////////////////////////////////////////

        if (propertyModel.carParking == 0)
          const SizedBox()
        else
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 14,
                        width: 14,
                        child: Image.asset(ImageConstant.detailcarparking),
                      ),
                      const Gap(8),
                      Text(
                        "CAR PARCKING",
                        style: TextStyle(
                            color: AppColors.titleTextColor, fontSize: 11),
                      )
                    ],
                  ),
                ),
                Text(
                  propertyModel.carParking.toString(),
                  style: TextStyle(
                      color: AppColors.titleTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ), /////////////////////////////////////////////////////////////////////////////////////////////////////////

        if (propertyModel.bhk == 0 || propertyModel.bhk == null)
          const SizedBox()
        else
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 14,
                        width: 14,
                        child: Image.asset(ImageConstant.detailbhk),
                      ),
                      const Gap(8),
                      Text(
                        "BHK",
                        style: TextStyle(
                            color: AppColors.titleTextColor, fontSize: 11),
                      )
                    ],
                  ),
                ),
                Text(
                  propertyModel.getbhk,
                  style: TextStyle(
                      color: AppColors.titleTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ), /////////////////////////////////////////////////////////////////////////////////////////////////////////

        if (propertyModel.pricePerstft == 0)
          const SizedBox()
        else
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 14,
                        width: 14,
                        child: Image.asset(ImageConstant.detailpricepersqft),
                      ),
                      const Gap(8),
                      Text(
                        "PRICE PER SQ.FT.",
                        style: TextStyle(
                            color: AppColors.titleTextColor, fontSize: 11),
                      )
                    ],
                  ),
                ),
                Text(
                  propertyModel.pricePerstft.toString(),
                  style: TextStyle(
                      color: AppColors.titleTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ), /////////////////////////////////////////////////////////////////////////////////////////////////////////

        if (propertyModel.projectName == '')
          const SizedBox()
        else
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 14,
                        width: 14,
                        child: Image.asset(ImageConstant.detailprojectname),
                      ),
                      const Gap(8),
                      Text(
                        "PROJECT NAME",
                        style: TextStyle(
                            color: AppColors.titleTextColor, fontSize: 11),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Text(
                    propertyModel.projectName.toString(),
                    style: TextStyle(
                      color: AppColors.titleTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
