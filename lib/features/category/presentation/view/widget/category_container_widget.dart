import 'package:flutter/material.dart';
import 'package:hinvex_app/features/category/data/local%20data/category_store.dart';
import 'package:hinvex_app/features/category/presentation/provider/category_filter_provider.dart';
import 'package:hinvex_app/features/category/presentation/view/screen/category_display_screen.dart';
import 'package:hinvex_app/general/widgets/custom_image_widget.dart';
import 'package:hinvex_app/general/utils/colors.dart';
import 'package:provider/provider.dart';

class CategoryContainerWidget extends StatefulWidget {
  const CategoryContainerWidget({super.key});

  @override
  State<CategoryContainerWidget> createState() =>
      _CategoryContainerWidgetState();
}

class _CategoryContainerWidgetState extends State<CategoryContainerWidget> {
  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width / 2;
    double itemHeight = 30.0;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.5,
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 7,
              mainAxisSpacing: 7,
              crossAxisCount: 2,
              childAspectRatio: 2),
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            final categories = categoryList[index];
            return GestureDetector(
              onTap: () {
                Provider.of<CategoryFilterProvider>(context, listen: false)
                    .isCategoryTapped(index + 1);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CategoryDisplayScreen(),
                  ),
                );
              },
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: itemWidth,
                  maxHeight: itemHeight,
                ),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    CustumImage(
                      image: categories.image,
                      height: 32,
                      width: 32,
                    ),
                    Text(
                      categories.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.titleTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
