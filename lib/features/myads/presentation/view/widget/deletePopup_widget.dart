import 'package:flutter/material.dart';
import 'package:hinvex_app/features/myads/presentation/provider/myads_provider.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:hinvex_app/general/utils/progress_indicator_widget/progress_indicator_widget.dart';
import 'package:provider/provider.dart';

class DeletePostConfirmationDialog extends StatelessWidget {
  final String postId;

  const DeletePostConfirmationDialog({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backgroundColor,
      title: Text(
        'Delete Post',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.titleTextColor,
        ),
      ),
      content: Text(
        'Do you want to delete post',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.titleTextColor,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 30,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.textButtonColor,
              ),
              child: Center(
                child: Text(
                  'No',
                  style: TextStyle(
                    color: AppColors.buttonTextColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            onTap: () {
              showProgress(context);
              Provider.of<MyAdsProvider>(context, listen: false)
                  .deleteUploadedPosts(
                id: postId,
                onSuccess: () {
                  Provider.of<MyAdsProvider>(context, listen: false)
                      .removeFromMyAdsList(postId);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                onFailure: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              );
            },
            child: Container(
              height: 30,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.textButtonColor,
              ),
              child: Center(
                child: Text(
                  'Yes',
                  style: TextStyle(
                    color: AppColors.buttonTextColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
