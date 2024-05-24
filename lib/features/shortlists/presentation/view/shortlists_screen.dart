import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/authentication/presentation/provider/auth_provider.dart';
import 'package:hinvex_app/features/bottomNavigationBar/presentation/view/bottom_navigation_widget.dart';
import 'package:hinvex_app/features/property_details_view/presentation/view/property_details_screen.dart';
import 'package:hinvex_app/features/shortlists/presentation/provider/shortlist_provider.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_image_widget.dart';
import 'package:hinvex_app/general/utils/image_constants.dart';
import 'package:hinvex_app/general/utils/colors.dart';
import 'package:hinvex_app/general/utils/shimmer/property_card_simmer.dart';
import 'package:hinvex_app/general/widgets/nodata_widget.dart';
import 'package:hinvex_app/general/widgets/property_card_items.dart';
import 'package:provider/provider.dart';

class ShortListsScreen extends StatefulWidget {
  const ShortListsScreen({super.key});

  @override
  State<ShortListsScreen> createState() => _ShortListsScreenState();
}

class _ShortListsScreenState extends State<ShortListsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userFavoriteList =
          context.read<AuthenticationProvider>().userModel?.favoriteProducts;

      final reverseList = userFavoriteList?.reversed.toList();
      if ((reverseList ?? []).isNotEmpty) {
        context.read<ShortListProvider>().init(reverseList!);
      }
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
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<ShortListProvider>(
            builder: (context, state, child) {
              return CustomScrollView(
                controller: state.scrollController,
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    backgroundColor: AppColors.backgroundColor,
                    surfaceTintColor: AppColors.backgroundColor,
                    automaticallyImplyLeading: false,
                    titleSpacing: 2,
                    title: CustumImage(
                      image: ImageConstant.hinvexAppLogo,
                      height: 15.87,
                      width: 72.66,
                      alignment: Alignment.topLeft,
                    ),
                    bottom: PreferredSize(
                      preferredSize: const Size(double.infinity, 20),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "My Shortlist",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: AppColors.titleTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (state.propertiesList.isEmpty && state.isLoading)
                    const SliverFillRemaining(
                        hasScrollBody: false,
                        child: PropertyShimmerCardWidget())
                  else if (state.propertiesList.isEmpty &&
                      state.isLoading == false)
                    const SliverFillRemaining(
                      hasScrollBody: false,
                      child: NoDataWidget(),
                    )
                  else
                    SliverList.builder(
                      itemCount: state.propertiesList.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PropertyDetailsScren(
                                    propertyModel: state.propertiesList[index]),
                              ));
                        },
                        child: PropertyCardItems(
                          postModel: state.propertiesList[index],
                        ),
                      ),
                    ),
                  if (state.isLoading && state.propertiesList.isNotEmpty)
                    const SliverToBoxAdapter(
                      child: Center(
                        child: CupertinoActivityIndicator(),
                      ),
                    )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
