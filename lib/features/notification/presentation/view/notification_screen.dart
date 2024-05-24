import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/notification/presentation/provider/notification_provider.dart';
import 'package:hinvex_app/features/notification/presentation/view/widget/notification_card.dart';
import 'package:hinvex_app/features/notification/presentation/view/widget/notification_shimmer_card.dart';
import 'package:hinvex_app/general/widgets/custom_image_widget.dart';
import 'package:hinvex_app/general/utils/image_constants.dart';
import 'package:hinvex_app/general/utils/colors.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NotificationProvider>().init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<NotificationProvider>(
          builder: (context, notificationState, child) {
            return CustomScrollView(
              controller: notificationState.scrollController,
              slivers: [
                SliverAppBar(
                  // backgroundColor: AppColors.backgroundColor,
                  iconTheme: IconThemeData(color: AppColors.titleTextColor),
                  title: Text(
                    "Notification",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.titleTextColor,
                    ),
                  ),
                ),
                if (notificationState.notificationList.isEmpty &&
                    notificationState.isLoading)
                  const SliverFillRemaining(
                      hasScrollBody: false,
                      child: NotificationShimmerCardWidget())
                else if (notificationState.notificationList.isEmpty &&
                    notificationState.isLoading == false)
                  SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 88.0, bottom: 8),
                              child: CustumImage(
                                image: ImageConstant.defaultNotification,
                                height: 177.87,
                                width: 150,
                                alignment: Alignment.topLeft,
                              ),
                            ),
                            Text(
                              "No notifications received at the\n  moment, providing a tranquil\n                   interface.",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.titleTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                else
                  SliverList.builder(
                    itemCount: notificationState.notificationList.length,
                    itemBuilder: (context, index) {
                      return NotificationCard(
                        notificationModel:
                            notificationState.notificationList[index],
                      );
                    },
                  ),
                if (notificationState.isLoading &&
                    notificationState.notificationList.isNotEmpty)
                  const SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CupertinoActivityIndicator(),
                      ),
                    ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
