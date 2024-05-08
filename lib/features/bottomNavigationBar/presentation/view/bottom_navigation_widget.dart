import 'package:flutter/material.dart';
import 'package:hinvex_app/features/category/presentation/view/category_screen.dart';
import 'package:hinvex_app/features/home/presentation/view/home_screen.dart';
import 'package:hinvex_app/features/sell/presentation/view/sell_screen.dart';
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
    HomeScreen(),
    HomeScreen(),
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
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: CustumImage(
                height: 24,
                width: 24,
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
                width: 24,
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
                width: 24,
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
                width: 24,
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
                width: 24,
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
          elevation: 6,
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
