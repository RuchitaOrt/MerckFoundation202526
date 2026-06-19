import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;

      case TargetPlatform.iOS:
        return ios;

      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions not supported',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC4iSTBcQgwVZclAs-Gc89ML5kEb_RSV9s',
    appId: '1:400096468842:android:d44ffd811692f371a34f13',
    messagingSenderId: '400096468842',
    projectId: 'merck-foundation-revamp',
    storageBucket: 'merck-foundation-revamp.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcB6qAqqEhi1v6-K3z9mBX_vwIBHB_vAg',
    appId: '1:400096468842:ios:1dab0f91aeea5e90a34f13',
    messagingSenderId: '400096468842',
    projectId: 'merck-foundation-revamp',
    storageBucket: 'merck-foundation-revamp.firebasestorage.app',
    iosBundleId: 'com.merck.foundation',
  );
}