import 'package:hinvex_app/features/notification/data/model/notification_model.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';

abstract class INotificationFacade {
  FutureResult<List<NotificationModel>> fetchNotifications() {
    throw UnimplementedError('fetchNotifications() is not implemented');
  }

  void clearData();
}
