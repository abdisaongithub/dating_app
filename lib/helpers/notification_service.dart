import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;


class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  late AndroidNotificationChannel androidNotificationChannel;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  BuildContext context;

  NotificationService(this.context);

  Future<void> listenToFirebaseCloudMessaging() async {
    debugPrint('Initializing FCM');

    if (Platform.isIOS) iOSPermission();

    await _initSettings();

    androidNotificationChannel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        description:
            'This channel is used for important notifications.', // description
        importance: Importance.high,
        playSound: true);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage event) {
      // Navigator.of(context).push(
      //   CupertinoPageRoute(
      //     builder: (ctx) => const NotificationScreen(),
      //   ),
      // );
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Handling Foreground Notification: ${message.data}');
      handleFcmMessage(message);
    });

    debugPrint('Initializing FCM DONE');
  }

  Future<void> _initSettings() async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('ic_notification');
    var initializationSettingsIOs = const DarwinInitializationSettings();
    var initSetttings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOs);

    await flutterLocalNotificationsPlugin.initialize(
      initSetttings,
      onDidReceiveNotificationResponse: (payload) async {
        // Navigator.of(context).push(
        //     CupertinoPageRoute(builder: (ctx) => const NotificationScreen()));
      },
    );
  }

  void handleFcmMessage(RemoteMessage message) {
    RemoteNotification notification = message.notification!;

    if (Platform.isAndroid) {
      showAndroidLocalNotificationBasedOnFCM(notification);
    } else if (Platform.isIOS) {
      // Handle iOS notification
    } else {
      debugPrint('Platform is not supported!');
    }
  }

  Future<void> iOSPermission() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  Future<void> showAndroidLocalNotificationBasedOnFCM(
      RemoteNotification notification) async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .createNotificationChannel(androidNotificationChannel);

    showAndroidLocalNotification(notification.hashCode, notification.title,
        notification.body, notification.android?.imageUrl);
  }

  Future<void> showAndroidLocalNotification(int id, String? title, String? body,
      [String? largeIconUrl]) async {
    AndroidBitmap<Object>? largeIcon = largeIconUrl != null
        ? await _getAndroidBitmapFromUrl(largeIconUrl)
        : null;

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          androidNotificationChannel.id,
          androidNotificationChannel.name,
          channelDescription: androidNotificationChannel.description,
          priority: Priority.max,
          largeIcon: largeIcon,
        ),
      ),
    );
  }

  Future<ByteArrayAndroidBitmap> _getAndroidBitmapFromUrl(String url) async {
    final ByteArrayAndroidBitmap bitmap =
        ByteArrayAndroidBitmap(await _getByteArrayFromUrl(url));

    return bitmap;
  }

  Future<Uint8List> _getByteArrayFromUrl(String url) async {
    final http.Response response = await http.get(Uri.parse(url));
    return response.bodyBytes;
  }
}
