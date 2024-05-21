import 'package:flutter/material.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';

class FurnishingWidget extends StatelessWidget {
  const FurnishingWidget({super.key,required this.onTap, required this.value});
  final void Function(int value) onTap;
  final int? value;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      GestureDetector(
                  onTap: (){
                    onTap.call(1);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 10,bottom: 10,top: 10),
                    decoration: BoxDecoration(
                      color:value==1?AppColors.blueColor: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.titleTextColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Fully Furnished",
                        style:  TextStyle(
                          color:value==1?AppColors.backgroundColor: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),),
                  GestureDetector(
                  onTap: (){
                    onTap.call(2);
                  },
                  child: Container(
                   padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 10,bottom: 10,top: 10),
                    decoration: BoxDecoration(
                      color:value==2? AppColors.blueColor:AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.titleTextColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Semi Furnished",
                        style:  TextStyle(
                          color:value==2?AppColors.backgroundColor: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),),
                   GestureDetector(
                  onTap: (){
                    onTap.call(3);
                  },
                  child: Container(
                   padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 10,bottom: 10,top: 10),
                    decoration: BoxDecoration(
                      color:value==3? AppColors.blueColor:AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.titleTextColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                       "Un Furnished",
                        style:  TextStyle(
                          color:value==3?AppColors.backgroundColor: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),),
       
    ],);
  }
}