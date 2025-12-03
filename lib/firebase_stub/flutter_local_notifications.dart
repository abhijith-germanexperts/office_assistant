library flutter_local_notifications_stub;

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class FlutterLocalNotificationsPlugin {
  Future<void> initialize(Object? settings, {Function? onDidReceiveNotificationResponse}) async {}
  Future<void> show(int id, String? title, String? body, Object? details, {Object? payload}) async {}
}
class AndroidInitializationSettings {
  final String icon;
  AndroidInitializationSettings(this.icon);
}
class DarwinInitializationSettings {
  final bool requestAlertPermission;
  const DarwinInitializationSettings({this.requestAlertPermission = false});
}
class AndroidNotificationDetails {
  final String channelId, channelName, channelDescription;
  final Importance? importance;
  final String? sound;
  AndroidNotificationDetails(this.channelId, this.channelName, this.channelDescription, {this.importance, this.sound});
}
class NotificationDetails {
  final AndroidNotificationDetails? android;
  const NotificationDetails({this.android});
}
class AndroidFlutterLocalNotificationsPlugin {}
