import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptionsManual {
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "YOUR_ANDROID_API_KEY",
    appId: "YOUR_ANDROID_APP_ID",
    messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
    projectId: "YOUR_PROJECT_ID",
    storageBucket: "YOUR_STORAGE_BUCKET",
    measurementId: "YOUR_MEASUREMENT_ID",
  );
}
