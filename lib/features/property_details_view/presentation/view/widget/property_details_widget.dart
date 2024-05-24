import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/general/utils/app_details.dart';
import 'package:hinvex_app/general/utils/colors.dart';
import 'package:maps_launcher/maps_launcher.dart';

class PropertyDetails extends StatelessWidget {
  final PropertyModel propertyModel;

  const PropertyDetails({
    super.key,
    required this.propertyModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(
            propertyModel.propertyDetils.toString(),
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${propertyModel.propertyLocation!.localArea.toString()}, ${propertyModel.propertyLocation!.district.toString()}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              InkWell(
                onTap: () {
                  MapsLauncher.launchCoordinates(
                      propertyModel.propertyLocation!.geoPoint.latitude,
                      propertyModel.propertyLocation!.geoPoint.longitude,
                      "${AppDetails.appName} Property Location");
                },
                child: Container(
                  height: 26,
                  width: 114,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.grey[300],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: Colors.blue,
                        size: 18,
                      ),
                      Text(
                        "View Location",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(),
          )
        ],
      ),
    );
  }
}
