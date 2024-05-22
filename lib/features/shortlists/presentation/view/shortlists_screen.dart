import 'package:flutter/material.dart';
import 'package:hinvex_app/features/bottomNavigationBar/presentation/view/bottom_navigation_widget.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_image_widget.dart';
import 'package:hinvex_app/general/utils/Customwidgets/CustomNetworkImageWidget.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';

class ShortListsScreen extends StatefulWidget {
  const ShortListsScreen({super.key});

  @override
  State<ShortListsScreen> createState() => _ShortListsScreenState();
}

class _ShortListsScreenState extends State<ShortListsScreen> {
  int count = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        // ignore: deprecated_member_use
        child: WillPopScope(
          onWillPop: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const BottomNavigationWidget();
              },
            ));
            return Future.value(true);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomScrollView(
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
                            "My Shortlist",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: AppColors.titleTextColor,
                            ),
                          ),
                        ),
                      ]),
                ),
                SliverList.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.backgroundColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(16),
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
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 16.0,
                                        left: 16,
                                        right: 16,
                                      ),
                                      child: SizedBox(
                                        height:
                                            156, // Adjust the height as needed
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: count,
                                          itemBuilder: (context, index) {
                                            return Stack(
                                              children: [
                                                const CustomNetworkImageWidget(
                                                  imageUrl:
                                                      "https://media.istockphoto.com/id/1213134164/photo/art-deco-interior-in-classic-style-with-pink-armchair-and-pillow-vase-on-table-dark-green.jpg?s=612x612&w=0&k=20&c=xLNj8p7wymf8iGIjo0jSFs-doo88bOdFn6DeCF7_Dys=",
                                                  width:
                                                      228, // Adjust the width as needed
                                                  height: 156,
                                                ),
                                                Positioned(
                                                  top: 12,
                                                  right: 18,
                                                  child: Text(
                                                    "${index + 1}/$count",
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "\u{20B9} 43,00,000",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color:
                                                    AppColors.titleTextColor),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text(
                                            "3 Beds, 3 Bathrooms, Swimming Pool includedddddddddddddd",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const Text(
                                            "House For Sale in prime location, exact in Kozhikode cccccccccccccc",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Text(
                                            "Kunnamangalam, Kozhikode",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Positioned(
                                top: 28,
                                right: 22,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.white54,
                                  child: Icon(
                                    Icons.favorite,
                                    size: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
