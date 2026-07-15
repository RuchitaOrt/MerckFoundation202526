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
    apiKey: 'AIzaSyAtjNNBAA8ZsMsIuNGF1hZC2aN8fOhQkbc',
    appId: '1:664350243322:android:b7497e4344fb9b6c078c43',
    messagingSenderId: '664350243322',
    projectId: 'merckfoundation-revamp',
    storageBucket: 'merckfoundation-revamp.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDi3tYh3pPrbv1jQ4Ha1TSiXZ9Uy927Jgs',
    appId: '1:664350243322:ios:e45e7b9bd30814ab078c43',
    messagingSenderId: '664350243322',
    projectId: 'merckfoundation-revamp',
    storageBucket: 'merckfoundation-revamp.firebasestorage.app',
    iosBundleId: 'com.merck.foundation',
  );
}