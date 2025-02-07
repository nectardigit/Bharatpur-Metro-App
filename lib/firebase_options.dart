import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (TargetPlatform.android == defaultTargetPlatform) {
      return const FirebaseOptions(
        apiKey: 'AIzaSyBApC3OPu5lmNWg1m9WkHYpaAxItPv-awE',
        projectId: 'today-s-technology',
        messagingSenderId: '661253628293',
        appId: '1:661253628293:android:e68a1ab925d44a7a9124ec',
        // ... any other Android specific options
      );
    } else {
      return const FirebaseOptions(
        apiKey: 'YOUR_IOS_API_KEY',
        authDomain: 'YOUR_IOS_AUTH_DOMAIN',
        projectId: 'YOUR_IOS_PROJECT_ID',
        storageBucket: 'YOUR_IOS_STORAGE_BUCKET',
        messagingSenderId: 'YOUR_IOS_MESSAGING_SENDER_ID',
        appId: 'YOUR_IOS_APP_ID',
        // ... any other iOS specific options
      );
    }
  }
}
