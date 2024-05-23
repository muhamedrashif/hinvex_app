import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hinvex_app/features/home/presentation/provider/home_provider.dart';
import 'package:hinvex_app/features/home/presentation/view/widgets/banner_widget.dart';
import 'package:hinvex_app/features/notification/presentation/view/notification_screen.dart';
import 'package:hinvex_app/features/profile/presentation/view/profile_screen.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_image_widget.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:hinvex_app/general/utils/showExitPopup_widget/showexitpopup_widget.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textformfield_widget.dart';
import 'package:provider/provider.dart';

import 'widgets/s.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeProvider>().init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_rounded,
                                      color: Colors.blue,
                                      size: 20,
                                    ),
                                    Gap(4),
                                    Text(
                                      "Kunnamangalam",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                    )
                                  ],
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
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: state.fetchBannerLoading
                              ? const CircularProgressIndicator()
                              : BannerCarouselWidget(
                                  bannerList: state.bannerList),
                        ),
                        SliverToBoxAdapter(
                          child: Bar(),
                        ),
                        const SliverToBoxAdapter(
                          child: Text(
                            "Fresh Recommendation",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
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
