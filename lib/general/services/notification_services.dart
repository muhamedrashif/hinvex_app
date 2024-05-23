import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hinvex_app/general/di/injection.dart';

class NotificationServices {
  static final messaging = sl<FirebaseMessaging>();
  final flutterLocalNotification = FlutterLocalNotificationsPlugin();

  //premission for notification
  Future<void> _requestPermission() async {
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  //FORGROUND MESSAGING
  void _forgroundMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showNotification(message: message);
    });
  }

  //BACKGROND SERVICES

  Future<void> _backGroundMessaging() async {
    FirebaseMessaging.onBackgroundMessage((message) async {});
  }

  //SHOW NOTIFICATION
  Future<void> _showNotification({required RemoteMessage message}) async {
    final notification = message.notification;
    flutterLocalNotification.show(
        1,
        notification?.title ?? '',
        notification?.body,
        const NotificationDetails(
            android: AndroidNotificationDetails("channel_id", "channel_name"),
            iOS: DarwinNotificationDetails()));
  }

  //INIT FUNCTION
  Future<void> initializeNotifications() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final initializationSettingsIOS = DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) {},
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
    await flutterLocalNotification.initialize(initializationSettings);
    _forgroundMessaging();
  }

  //SHOW NOTIFICATION

  Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '2121221',
      '62222222',
      importance: Importance.max,
      priority: Priority.high,
    );
    const iOSPlatformChannelSpecifics = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotification.show(
      0,
      title,
      body,
      platformChannelSpecifics,
    );
  }
}
