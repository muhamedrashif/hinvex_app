import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hinvex_app/features/authentication/presentation/view/authentocation_screen.dart';
import 'package:hinvex_app/features/banner/presentation/provider/banner_provider.dart';
import 'package:hinvex_app/features/home/presentation/provider/home_provider.dart';
import 'package:hinvex_app/features/banner/presentation/view/banner_screen.dart';
import 'package:hinvex_app/features/banner/presentation/view/widget/banner_shimmer.dart';
import 'package:hinvex_app/features/location/presentation/provider/location_provider.dart';
import 'package:hinvex_app/features/location/presentation/view/widgets/search_location_widget.dart';
import 'package:hinvex_app/features/notification/presentation/view/notification_screen.dart';
import 'package:hinvex_app/features/profile/presentation/view/profile_screen.dart';
import 'package:hinvex_app/features/property_details_view/presentation/view/property_details_screen.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_image_widget.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:hinvex_app/general/utils/showExitPopup_widget/showexitpopup_widget.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textformfield_widget.dart';
import 'package:hinvex_app/general/widgets/property_card_items.dart';
import 'package:provider/provider.dart';
import 'widgets/property_card_simmer.dart';
import 'widgets/tabbar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // context.read<HomeProvider>().init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final banneProvider = Provider.of<BannerProvider>(context, listen: false);
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Consumer<HomeProvider>(builder: (context, state, _) {
        return SafeArea(
          // ignore: deprecated_member_use
          child: WillPopScope(
            onWillPop: () => showExitPopup(context),
            child: Column(
              children: [
                // Fixed Header Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustumImage(
                                image: ImageConstant.hinvexAppLogo,
                                height: 15.87,
                                width: 72.66,
                                alignment: Alignment.topLeft,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SearchLocationWidget(),
                                      ));
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_rounded,
                                        color: Colors.blue,
                                        size: 20,
                                      ),
                                      const Gap(4),
                                      Text(
                                        locationProvider
                                                .currentPlaceCell.localArea ??
                                            locationProvider
                                                .currentPlaceCell.district,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          GestureDetector(
                            child: CustumImage(
                              image: ImageConstant.bellIcon,
                              height: 27.87,
                              width: 27.87,
                              alignment: Alignment.topLeft,
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NotificationScreen(),
                                  ));
                            },
                          ),
                          GestureDetector(
                            child: CustumImage(
                              image: ImageConstant.profileIcon,
                              height: 27.87,
                              width: 27.87,
                              alignment: Alignment.topLeft,
                            ),
                            onTap: () {
                              if (FirebaseAuth.instance.currentUser == null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AuthenticationScreen(),
                                  ),
                                );
                                return;
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ProfileScreen(),
                                  ));
                            },
                          ),
                        ],
                      ),
                      const Gap(8),
                      const CustomTextFormFieldWidget(
                        height: 44,
                        hintText: "Search here, eg;",
                        suffixIcon: Icon(
                          Icons.search_rounded,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                // Scrollable Content Section
                Expanded(
                  child: CustomScrollView(
                    controller: state.scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: banneProvider.fetchBannerloading
                              ? const BannerShimmerWidget()
                              : BannerCarouselWidget(
                                  bannerList: banneProvider.bannerList),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TabBarWidget(),
                        ),
                      ),
                      const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Fresh Recommendation",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                      ),
                      if (state.propertyList.isEmpty &&
                          state.fetchProductsLoading)
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: propertyShimmerCardWidget(),
                        )
                      else if (state.propertyList.isEmpty &&
                          state.fetchProductsLoading == false)
                        const SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: Text("No My Ads"),
                          ),
                        )
                      else
                        SliverList.builder(
                            itemCount: state.propertyList.length,
                            itemBuilder: (context, index) {
                              log("LENGTH: ${state.propertyList.length.toString()}");
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PropertyDetailsScren(
                                                propertyModel:
                                                    state.propertyList[index]),
                                      ));
                                },
                                child: PropertyCardItems(
                                    postModel: state.propertyList[index]),
                              );
                            }),
                      if (state.propertyList.isNotEmpty &&
                          state.fetchProductsLoading)
                        SliverToBoxAdapter(
                          child: Center(
                            child: CupertinoActivityIndicator(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
