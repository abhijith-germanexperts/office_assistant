library firebase_core_stub;
class FirebaseOptions {
  final String apiKey, appId, messagingSenderId, projectId;
  const FirebaseOptions({required this.apiKey, required this.appId, required this.messagingSenderId, required this.projectId});
}
class Firebase {
  static Future<void> initializeApp({FirebaseOptions? options}) async {}
}
