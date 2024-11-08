// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_master/core/env.dart';

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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: Env.webApiKey,
    appId: '1:989335601535:web:c66eb4a43b69e8a26d1a4a',
    messagingSenderId: '989335601535',
    projectId: 'flutter-master-edcab',
    authDomain: 'flutter-master-edcab.firebaseapp.com',
    storageBucket: 'flutter-master-edcab.firebasestorage.app',
    measurementId: 'G-BM3NLNLYBW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: Env.androidApiKey,
    appId: '1:989335601535:android:5a77a403b2271e136d1a4a',
    messagingSenderId: '989335601535',
    projectId: 'flutter-master-edcab',
    storageBucket: 'flutter-master-edcab.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: Env.iosApiKey,
    appId: '1:989335601535:ios:3c666bbebe8bfff86d1a4a',
    messagingSenderId: '989335601535',
    projectId: 'flutter-master-edcab',
    storageBucket: 'flutter-master-edcab.firebasestorage.app',
    iosBundleId: 'com.example.flutterMaster',
  );
}
