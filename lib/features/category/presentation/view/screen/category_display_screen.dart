import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/category/presentation/provider/category_filter_provider.dart';
import 'package:hinvex_app/features/category/presentation/view/screen/category_filter_screen.dart';
import 'package:hinvex_app/features/property_details_view/presentation/view/property_details_screen.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:hinvex_app/general/widgets/property_card_items.dart';
import 'package:provider/provider.dart';

class CategoryDisplayScreen extends StatefulWidget {
  const CategoryDisplayScreen({super.key});

  @override
  State<CategoryDisplayScreen> createState() => _CategoryDisplayScreenState();
}

class _CategoryDisplayScreenState extends State<CategoryDisplayScreen> {
  @override
  void initState() {
    // context.read<CategoryFilterProvider>().clearData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CategoryFilterProvider>().init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: AppColors.backgroundColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.primaryColor,
              )),
          title: Text(
            "Properties",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Filter implemented in;",
              style: TextStyle(
                fontSize: 13,
                color: AppColors.subtitleTextColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kunnamangalam,Kozikode",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.blueColor,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 8, bottom: 8),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                  ),
                  child: Text(
                    "Change",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: AppColors.blueColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Divider(
              thickness: 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Search Result;",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.subtitleTextColor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CategoryFilterScreen(),
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.tune,
                            color: AppColors.backgroundColor,
                            size: 25,
                          ),
                        ),
                        Text(
                          "Change",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: AppColors.backgroundColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Consumer<CategoryFilterProvider>(
            builder: (context, state, child) {
              return (state.filteredUploadedPropertiesList.isEmpty &&
                      state.isLoading)
                  ? const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Center(
                        child: CupertinoActivityIndicator(),
                      ),
                    )
                  : state.filteredUploadedPropertiesList.isEmpty
                      ? const Center(
                          child: Text(
                            "No Data.!",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      : Expanded(
                          child: ListView.separated(
                            controller: state.scrollController,
                            itemCount:
                                state.filteredUploadedPropertiesList.length,
                            itemBuilder: (context, index) {
                              final uplodedList =
                                  state.filteredUploadedPropertiesList[index];
                              return Column(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PropertyDetailsScren(
                                                      propertyModel:
                                                          uplodedList),
                                            ));
                                      },
                                      child: PropertyCardItems(
                                        postModel: uplodedList,
                                      )),
                                  if (index ==
                                          state.filteredUploadedPropertiesList
                                                  .length -
                                              1 &&
                                      state.isLoading)
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Center(
                                        child: CupertinoActivityIndicator(),
                                      ),
                                    )
                                ],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                          ),
                        );
            },
          ),
        ]));
  }
}
