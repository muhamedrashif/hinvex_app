import 'package:flutter/material.dart';
import 'package:hinvex_app/features/category/presentation/view/screen/category_screen.dart';
import 'package:hinvex_app/features/home/presentation/view/home_screen.dart';
import 'package:hinvex_app/features/myads/presentation/view/myads_screen.dart';
import 'package:hinvex_app/features/sell/presentation/view/sell_product_main/screens/sell_screen.dart';
import 'package:hinvex_app/features/shortlists/presentation/view/shortlists_screen.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_image_widget.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CategoryScreen(),
    SellScreen(),
    ShortListsScreen(),
    MyAdsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(13),
            topRight: Radius.circular(13),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 0,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(13),
            topRight: Radius.circular(13),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: CustumImage(
                  height: 24,
                  width: 18,
                  image: ImageConstant.unhome,
                ),
                activeIcon: CustumImage(
                  height: 24,
                  width: 24,
                  image: ImageConstant.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: CustumImage(
                  height: 24,
                  width: 18,
                  image: ImageConstant.uncategory,
                ),
                activeIcon: CustumImage(
                  height: 24,
                  width: 24,
                  image: ImageConstant.category,
                ),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: CustumImage(
                  height: 24,
                  width: 18,
                  image: ImageConstant.unsell,
                ),
                activeIcon: CustumImage(
                  height: 24,
                  width: 24,
                  image: ImageConstant.sell,
                ),
                label: 'Sell',
              ),
              BottomNavigationBarItem(
                icon: CustumImage(
                  height: 24,
                  width: 18,
                  image: ImageConstant.unshortlist,
                ),
                activeIcon: CustumImage(
                  height: 24,
                  width: 24,
                  image: ImageConstant.shortlist,
                ),
                label: 'Shortlists',
              ),
              BottomNavigationBarItem(
                icon: CustumImage(
                  height: 24,
                  width: 18,
                  image: ImageConstant.unads,
                ),
                activeIcon: CustumImage(
                  height: 24,
                  width: 24,
                  image: ImageConstant.ads,
                ),
                label: 'My Ads',
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: AppColors.textButtonColor,
            onTap: _onItemTapped,
            selectedLabelStyle:
                const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            unselectedLabelStyle: const TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
