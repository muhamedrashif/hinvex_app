import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/notification/data/i_notification_facade.dart';
import 'package:hinvex_app/features/notification/data/model/notification_model.dart';
import 'package:hinvex_app/general/utils/toast/toast.dart';

class NotificationProvider extends ChangeNotifier {
  final INotificationFacade iNotificationFacade;
  NotificationProvider({required this.iNotificationFacade});
  ScrollController scrollController = ScrollController();

  List<NotificationModel> notificationList = [];
  bool isLoading = false;

  Future<void> fetchNotifications() async {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();
    final data = await iNotificationFacade.fetchNotifications();
    data.fold((l) {
      log(l.errorMsg);
      isLoading = false;
      notifyListeners();
      showToast(
        l.errorMsg,
      );
    }, (notification) {
      notificationList.addAll(notification);
      isLoading = false;
      notifyListeners();
    });
  }

  void clearData() {
    iNotificationFacade.clearData();
    isLoading = false;
    notificationList.clear();
    notifyListeners();
  }

  Future<void> init() async {
    clearData();
    fetchNotifications();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent != 0 &&
          scrollController.position.atEdge &&
          isLoading == false) {
        fetchNotifications();
      }
    });
    notifyListeners();
  }
}
