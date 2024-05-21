import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/category%20filter/presentation/provider/category_filter_provider.dart';
import 'package:hinvex_app/features/category%20filter/presentation/view/screen/category_filter_screen.dart';
import 'package:hinvex_app/features/category/presentation/view/widget/category_card_items.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:provider/provider.dart';

class CategoryDisplayScreen extends StatefulWidget {
  const CategoryDisplayScreen({super.key});

  @override
  State<CategoryDisplayScreen> createState() => _CategoryDisplayScreenState();
}

class _CategoryDisplayScreenState extends State<CategoryDisplayScreen> {
    @override
      void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CategoryFilterProvider>().init();
    });
    super.initState();
  }
  int count = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.backgroundColor,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: AppColors.primaryColor,)),
        title: Text(
          "Properties",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Filter implemented in;",
              style: TextStyle(
                fontSize: 13,
                color: AppColors.subtitleTextColor,
              ),
            ),
            Row(
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
                      fontSize: 15,
                      color: AppColors.blueColor,
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              thickness: 0.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Search Result: ",
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.subtitleTextColor,
                      ),
                    ),
                    Text(
                      "145",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>const CategoryFilterScreen(),));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.filter_alt_rounded,
                          color: AppColors.primaryColor,
                          size: 25,
                        ),
                        Text(
                          "Change",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppColors.blueColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
           const SizedBox(height: 10,),
            Consumer<CategoryFilterProvider>(
              builder: (context, state, child) {
                return (state.filteredUploadedPropertiesList.isEmpty&&state.isLoading)? 
              const Padding(
                 padding:  EdgeInsets.all(15.0),
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
                    :Expanded(
                child: ListView.separated(
                  controller: state.scrollController,
                  itemCount: state.filteredUploadedPropertiesList.length,
                  itemBuilder: (context, index) {
                   final uplodedList= state.filteredUploadedPropertiesList[index];
                    return  Column(
                      children: [
                        CategoryCardItems(
                         price: uplodedList.propertyPrice.toString(), 
                         title: uplodedList.propertyTitle??"",
                          details: uplodedList.propertyDetils??"",
                           location:  "${uplodedList.propertyLocation?.localArea},${uplodedList.propertyLocation?.district}", 
                           uploaderName: "Sabastian Thomas",
                            uploaderCategory: uplodedList.listedBy.toString(),
                             uploaderLocation: "Location; Palakkad",
                              uploadedDate:"11/12/2023",
                               image: uplodedList.propertyImage??[],
                               count: uplodedList.propertyImage?.length??0,),
                               if (index == state.filteredUploadedPropertiesList.length - 1 &&
                                    state.isLoading)
                                 const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: CupertinoActivityIndicator(),
                                    ),
                                  )
                      ],
                    );
                          
                  }, separatorBuilder: (BuildContext context, int index) { 
                    return const SizedBox(height: 10,);
                   },),
              );
              },
            ),
           
          ]
        )
      )
    );
  }
}