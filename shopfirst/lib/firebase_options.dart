// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCacRWgY8PN_xt2RBaT2zUcwDdT0VZydZY',
    appId: '1:291950441075:web:16435ad73732d682a3b006',
    messagingSenderId: '291950441075',
    projectId: 'shop-first-d5d48',
    authDomain: 'shop-first-d5d48.firebaseapp.com',
    storageBucket: 'shop-first-d5d48.appspot.com',
    measurementId: 'G-4VZBJ0CH9P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA57jeYbr5cAB6GCKMoAgJ5SnBKfOYvnXo',
    appId: '1:291950441075:android:093803377926145aa3b006',
    messagingSenderId: '291950441075',
    projectId: 'shop-first-d5d48',
    storageBucket: 'shop-first-d5d48.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcppywZLd001xa9YDdtQ1j_EC0Ik66jyM',
    appId: '1:291950441075:ios:7bb3b581afe93806a3b006',
    messagingSenderId: '291950441075',
    projectId: 'shop-first-d5d48',
    storageBucket: 'shop-first-d5d48.appspot.com',
    iosClientId:
        '291950441075-04i9199ao6lue11kqh57lucqgo8dngu1.apps.googleusercontent.com',
    iosBundleId: 'com.example.shopfirst',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCcppywZLd001xa9YDdtQ1j_EC0Ik66jyM',
    appId: '1:291950441075:ios:b8b5dd6515811cf1a3b006',
    messagingSenderId: '291950441075',
    projectId: 'shop-first-d5d48',
    storageBucket: 'shop-first-d5d48.appspot.com',
    iosClientId:
        '291950441075-15dogoltmie38vco0hbt8lel63o9o3rl.apps.googleusercontent.com',
    iosBundleId: 'com.example.shopfirst.RunnerTests',
  );
}