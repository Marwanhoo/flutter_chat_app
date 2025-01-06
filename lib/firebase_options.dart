// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB1KGDH6EHaXGQ06xYYltaR-JcOGTPlDMs',
    appId: '1:967201443520:web:f0fc6cbdd054a93cde6725',
    messagingSenderId: '967201443520',
    projectId: 'flutter-chat-app-28056',
    authDomain: 'flutter-chat-app-28056.firebaseapp.com',
    storageBucket: 'flutter-chat-app-28056.firebasestorage.app',
    measurementId: 'G-FW7F26MPVM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAlXRqAYbMdBXQ2GCkI-i5droE5YMz0fP4',
    appId: '1:967201443520:android:5e0d1e10105c172bde6725',
    messagingSenderId: '967201443520',
    projectId: 'flutter-chat-app-28056',
    storageBucket: 'flutter-chat-app-28056.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBHy8DChAEcFss9vdm5FLWfzlFPAaj5ns8',
    appId: '1:967201443520:ios:a7a603b7ec2d42b4de6725',
    messagingSenderId: '967201443520',
    projectId: 'flutter-chat-app-28056',
    storageBucket: 'flutter-chat-app-28056.firebasestorage.app',
    iosBundleId: 'com.chat.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBHy8DChAEcFss9vdm5FLWfzlFPAaj5ns8',
    appId: '1:967201443520:ios:adde95ce9fcf4d2dde6725',
    messagingSenderId: '967201443520',
    projectId: 'flutter-chat-app-28056',
    storageBucket: 'flutter-chat-app-28056.firebasestorage.app',
    iosBundleId: 'com.example.flutterChatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB1KGDH6EHaXGQ06xYYltaR-JcOGTPlDMs',
    appId: '1:967201443520:web:70a7945615f6f34cde6725',
    messagingSenderId: '967201443520',
    projectId: 'flutter-chat-app-28056',
    authDomain: 'flutter-chat-app-28056.firebaseapp.com',
    storageBucket: 'flutter-chat-app-28056.firebasestorage.app',
    measurementId: 'G-D079D3160R',
  );
}