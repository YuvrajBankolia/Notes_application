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
    apiKey: 'AIzaSyCchoWw5m6SfYUa3yvze9llzyQNRJvceSo',
    appId: '1:530600544700:web:5414951f2c413e0ebd43b9',
    messagingSenderId: '530600544700',
    projectId: 'project-2-flutter-2825c',
    authDomain: 'project-2-flutter-2825c.firebaseapp.com',
    storageBucket: 'project-2-flutter-2825c.appspot.com',
    measurementId: 'G-6X8PE0XELE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYbj_Y6-aQdMfa59dKEJNjw28DyRI_xM4',
    appId: '1:530600544700:android:8ef6bd2f589690c5bd43b9',
    messagingSenderId: '530600544700',
    projectId: 'project-2-flutter-2825c',
    storageBucket: 'project-2-flutter-2825c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAwKLERKWcQbGI8dw8shh8jEDIN81MShok',
    appId: '1:530600544700:ios:6b4993de69ac3df0bd43b9',
    messagingSenderId: '530600544700',
    projectId: 'project-2-flutter-2825c',
    storageBucket: 'project-2-flutter-2825c.appspot.com',
    iosBundleId: 'se.pixolity.mynotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAwKLERKWcQbGI8dw8shh8jEDIN81MShok',
    appId: '1:530600544700:ios:6b4993de69ac3df0bd43b9',
    messagingSenderId: '530600544700',
    projectId: 'project-2-flutter-2825c',
    storageBucket: 'project-2-flutter-2825c.appspot.com',
    iosBundleId: 'se.pixolity.mynotes',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCchoWw5m6SfYUa3yvze9llzyQNRJvceSo',
    appId: '1:530600544700:web:049196a5845a8448bd43b9',
    messagingSenderId: '530600544700',
    projectId: 'project-2-flutter-2825c',
    authDomain: 'project-2-flutter-2825c.firebaseapp.com',
    storageBucket: 'project-2-flutter-2825c.appspot.com',
    measurementId: 'G-1JEQWB6FFV',
  );

}