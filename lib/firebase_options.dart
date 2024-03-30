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
    apiKey: 'AIzaSyBZ32lDNCSax1gQkeBhO2XVgV4umTdyZBk',
    appId: '1:689386965595:web:c2b5855103bab19d4e8d7e',
    messagingSenderId: '689386965595',
    projectId: 'flutter-e-commerce-app-51ccb',
    authDomain: 'flutter-e-commerce-app-51ccb.firebaseapp.com',
    storageBucket: 'flutter-e-commerce-app-51ccb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBiGRprZr7x1bp7cSK7stb5mAAid5EBhCw',
    appId: '1:689386965595:android:b98366e8675fc84d4e8d7e',
    messagingSenderId: '689386965595',
    projectId: 'flutter-e-commerce-app-51ccb',
    storageBucket: 'flutter-e-commerce-app-51ccb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBngn06b1AHmQOOhC0DM7Vz7m3LgaQTEug',
    appId: '1:689386965595:ios:b1ceddfb3ce0ea914e8d7e',
    messagingSenderId: '689386965595',
    projectId: 'flutter-e-commerce-app-51ccb',
    storageBucket: 'flutter-e-commerce-app-51ccb.appspot.com',
    androidClientId:
        '689386965595-fvm2dpc9q06sudjgchqa26gbsebf8829.apps.googleusercontent.com',
    iosClientId:
        '689386965595-dn1rmitcp54h44o7gbv34gh9lhj21r9o.apps.googleusercontent.com',
    iosBundleId: 'com.example.shopVista',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBngn06b1AHmQOOhC0DM7Vz7m3LgaQTEug',
    appId: '1:689386965595:ios:7e6997a702900d674e8d7e',
    messagingSenderId: '689386965595',
    projectId: 'flutter-e-commerce-app-51ccb',
    storageBucket: 'flutter-e-commerce-app-51ccb.appspot.com',
    androidClientId:
        '689386965595-fvm2dpc9q06sudjgchqa26gbsebf8829.apps.googleusercontent.com',
    iosClientId:
        '689386965595-glgnvoq2026ag9bljqm4rochtgi3aag4.apps.googleusercontent.com',
    iosBundleId: 'com.example.shopVista.RunnerTests',
  );
}