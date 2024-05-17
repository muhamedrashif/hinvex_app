import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hinvex_app/features/bottomNavigationBar/presentation/view/bottom_navigation_widget.dart';
import 'package:hinvex_app/features/myads/presentation/provider/myads_provider.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_image_widget.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:provider/provider.dart';

import 'widget/myAddPropertyCard_widget.dart';
import 'widget/shimmer_card_widget.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({super.key});

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MyAdsProvider>().init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const BottomNavigationWidget();
          },
        ));
        return Future.value(true);
      },
      child: Consumer<MyAdsProvider>(builder: (context, state, _) {
        log("message======${state.myAdsList.length.toString()}");

        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomScrollView(
                  controller: state.scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustumImage(
                              image: ImageConstant.hinvexAppLogo,
                              height: 15.87,
                              width: 72.66,
                              alignment: Alignment.topLeft,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "My Ads",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: AppColors.titleTextColor,
                                ),
                              ),
                            ),
                          ]),
                    ),
                    if (state.myAdsList.isEmpty && state.fetchProductsLoading)
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: showShimmerCardWidget(),
                      )
                    else if (state.myAdsList.isEmpty &&
                        state.fetchProductsLoading == false)
                      const SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Text("No My Ads"),
                        ),
                      )
                    else
                      SliverList.builder(
                          itemCount: state.myAdsList.length,
                          itemBuilder: (context, index) {
                            return MyAddPropertyCardWidget(
                                propertyModel: state.myAdsList[index]);
                          }),
                    if (state.myAdsList.isNotEmpty &&
                        state.fetchProductsLoading)
                      const SliverToBoxAdapter(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                  ]),
            ),
          ),
        );
      }),
    );
  }
}
