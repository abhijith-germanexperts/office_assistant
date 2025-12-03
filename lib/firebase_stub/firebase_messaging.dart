library firebase_messaging_stub;
class RemoteMessage {
  final Map<String, dynamic>? data;
  final Notification? notification;
  RemoteMessage({this.data, this.notification});
}
class Notification {
  final String? title;
  final String? body;
  Notification({this.title, this.body});
}
class NotificationSettings {}
class FirebaseMessaging {
  static FirebaseMessaging? _instance;
  static FirebaseMessaging get instance => _instance ??= FirebaseMessaging();
  Future<NotificationSettings> requestPermission() async => NotificationSettings();
  Future<String?> getToken() async => null;
  static Future<void> onBackgroundMessage(Function(RemoteMessage) handler) async {}
  Stream<RemoteMessage> get onMessage => const Stream<RemoteMessage>.empty();
  Stream<RemoteMessage> get onMessageOpenedApp => const Stream<RemoteMessage>.empty();
}
class AndroidNotificationChannel {
  final String id, name, description;
  AndroidNotificationChannel(this.id, this.name, this.description);
}
enum Importance { max, high, defaultImportance, low, min, none, unspecified }
class RawResourceAndroidNotificationSound {
  final String res;
  RawResourceAndroidNotificationSound(this.res);
}
