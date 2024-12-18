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
    apiKey: 'AIzaSyC6yCF2z6tyaKDyzXpWQd9cfFklxDLMlEg',
    appId: '1:842672019245:web:281515aea4e6104aeba5a4',
    messagingSenderId: '842672019245',
    projectId: 'weatherapp-430e4',
    authDomain: 'weatherapp-430e4.firebaseapp.com',
    storageBucket: 'weatherapp-430e4.firebasestorage.app',
    measurementId: 'G-MW050BNHZF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpu9MSSicnxw7I9ZLSfMmFEFSc_vrB7vw',
    appId: '1:842672019245:android:cda04c0142756b62eba5a4',
    messagingSenderId: '842672019245',
    projectId: 'weatherapp-430e4',
    storageBucket: 'weatherapp-430e4.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBelKdvtWlb2c6NpZ-SJmx5ppAZHVTlDy8',
    appId: '1:842672019245:ios:3768efc1ed3265f0eba5a4',
    messagingSenderId: '842672019245',
    projectId: 'weatherapp-430e4',
    storageBucket: 'weatherapp-430e4.firebasestorage.app',
    iosBundleId: 'com.example.weatherApiApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBelKdvtWlb2c6NpZ-SJmx5ppAZHVTlDy8',
    appId: '1:842672019245:ios:3768efc1ed3265f0eba5a4',
    messagingSenderId: '842672019245',
    projectId: 'weatherapp-430e4',
    storageBucket: 'weatherapp-430e4.firebasestorage.app',
    iosBundleId: 'com.example.weatherApiApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC6yCF2z6tyaKDyzXpWQd9cfFklxDLMlEg',
    appId: '1:842672019245:web:19ce34836d4905b4eba5a4',
    messagingSenderId: '842672019245',
    projectId: 'weatherapp-430e4',
    authDomain: 'weatherapp-430e4.firebaseapp.com',
    storageBucket: 'weatherapp-430e4.firebasestorage.app',
    measurementId: 'G-4TGSPGY5CS',
  );
}
