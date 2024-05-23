import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/property_details_view/presentation/provider/propertydertails_provider.dart';
import 'package:hinvex_app/features/property_details_view/presentation/view/widget/property_details_widget.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'widget/property_image_slider_widget.dart';
import 'widget/property_sub_details_widget.dart';
import 'widget/uploader_details_widget.dart';

class PropertyDetailsScren extends StatefulWidget {
  final PropertyModel propertyModel;
  const PropertyDetailsScren({
    super.key,
    required this.propertyModel,
  });

  @override
  State<PropertyDetailsScren> createState() => _PropertyDetailsScrenState();
}

class _PropertyDetailsScrenState extends State<PropertyDetailsScren> {
  final currentUserId = FirebaseAuth.instance.currentUser!.uid;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.propertyModel.userId != 'owner') {
        Provider.of<PropertyDetailsProvider>(context, listen: false)
            .fetchUser(userId: widget.propertyModel.userId!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        iconTheme: IconThemeData(color: AppColors.titleTextColor),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                SizedBox(
                  height: 22,
                  width: 27,
                  child: Image.asset(ImageConstant.share),
                ),
                const SizedBox(width: 16),
                const Icon(
                  Icons.favorite_border,
                  size: 25,
                ),
              ],
            ),
          )
        ],
      ),
      body: Consumer<PropertyDetailsProvider>(builder: (context, state, _) {
        return state.fetchUserLoading
            ? Center(
                child: CupertinoActivityIndicator(
                color: AppColors.primaryColor,
              ))
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomScrollView(slivers: [
                  SliverToBoxAdapter(
                    child: PropertyImageSlider(
                      propertyImages: widget.propertyModel.propertyImage!,
                      userId: widget.propertyModel.userId,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: PropertyDetails(
                      propertyModel: widget.propertyModel,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: PropertySubDetails(
                      propertyModel: widget.propertyModel,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: UploaderDetails(
                      propertyModel: widget.propertyModel,
                      userModel: (widget.propertyModel.userId == 'owner'
                          ? null
                          : state.userModel),
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.propertyModel.description == '')
                        const SizedBox()
                      else
                        Text(
                          "Description",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColors.titleTextColor),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          widget.propertyModel.description.toString(),
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  )),
                ]),
              );
      }),
      bottomNavigationBar: widget.propertyModel.userId == currentUserId
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 44.22,
                    width: MediaQuery.of(context).size.width / 2.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.22),
                      color: Colors.green,
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.white,
                          size: 22,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "WhatsApp",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.44,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 44.22,
                    width: MediaQuery.of(context).size.width / 2.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.22),
                      color: AppColors.textButtonColor,
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.call,
                          color: Colors.white,
                          size: 22,
                        ),
                        SizedBox(width: 2),
                        Text(
                          "Call",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.44,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
