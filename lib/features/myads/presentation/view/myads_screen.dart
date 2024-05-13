import 'package:flutter/material.dart';
import 'package:hinvex_app/features/bottomNavigationBar/presentation/view/bottom_navigation_widget.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_image_widget.dart';
import 'package:hinvex_app/general/utils/Customwidgets/CustomNetworkImageWidget.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({super.key});

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
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
                                  color: Colors.white70,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
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
                                height: 93,
                                width: MediaQuery.of(context).size.width,
                                child: const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: 80,
                                              child: Text(
                                                "POSTED",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.grey,
                                                ),
                                              )),
                                          Text(
                                            "11/12/2023",
                                            style: TextStyle(
                                              fontSize: 11,
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                                width: 80,
                                                child: Text(
                                                  "VIEWS",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.grey,
                                                  ),
                                                )),
                                            Text(
                                              "321",
                                              style: TextStyle(
                                                fontSize: 11,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: 80,
                                              child: Text(
                                                "LIKES",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.grey,
                                                ),
                                              )),
                                          Text(
                                            "23",
                                            style: TextStyle(
                                              fontSize: 11,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: PopupMenuButton(
                                      color: AppColors.backgroundColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      splashRadius: 20,
                                      itemBuilder: (context) {
                                        return [
                                          PopupMenuItem(
                                            height: 30,
                                            onTap: () {},
                                            child: const Text("Edit"),
                                          ),
                                          PopupMenuItem(
                                            height: 30,
                                            onTap: () {},
                                            child: const Text("Remove"),
                                          ),
                                        ];
                                      },
                                    ),
                                  ))
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.backgroundColor,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 3,
                                      spreadRadius: 3,
                                      offset: const Offset(0, 4),
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
                                                      "https://media.istockphoto.com/id/1449681435/photo/luxury-apartment.jpg?s=612x612&w=0&k=20&c=6NH7IIvzEGhJMEuxaeVth1KXN0h6MSJCoNFiwq382ME=",
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
                                          Text(
                                            "3 Beds, 3 Bathrooms, Swimming Pool includedddddddddddddd"
                                                        .length >
                                                    43
                                                ? '${"3 Beds, 3 Bathrooms, Swimming Pool includeddddddddddddd".substring(0, 43)}...'
                                                : "3 Beds, 3 Bathrooms, Swimming Pool included...",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "House For Sale in prime location, exact in Kozhikode cccccccccccccc"
                                                        .length >
                                                    55
                                                ? '${"House For Sale in prime location, exact in Kozhikode cccccccccc".substring(0, 55)}...'
                                                : "House For Sale in prime location, exact in Kozhikode c...",
                                            style: const TextStyle(
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
