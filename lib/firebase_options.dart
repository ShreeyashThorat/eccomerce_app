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
    apiKey: 'AIzaSyDxvXZqPJQisJCE8NV8fljISIGWQiBL7n0',
    appId: '1:1060001868168:web:54a4c30550308fd5cbb23d',
    messagingSenderId: '1060001868168',
    projectId: 'ecommerce-229e7',
    authDomain: 'ecommerce-229e7.firebaseapp.com',
    storageBucket: 'ecommerce-229e7.appspot.com',
    measurementId: 'G-3RVL1DBMWT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmyClKnh-46KWjooEREhgi6ePzFCvjIBM',
    appId: '1:1060001868168:android:ce54c268d4e8ef13cbb23d',
    messagingSenderId: '1060001868168',
    projectId: 'ecommerce-229e7',
    storageBucket: 'ecommerce-229e7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAMNbNI-MqOLgcROe0fEOUWJ59fB1nVliU',
    appId: '1:1060001868168:ios:1c4d0e158fc9b508cbb23d',
    messagingSenderId: '1060001868168',
    projectId: 'ecommerce-229e7',
    storageBucket: 'ecommerce-229e7.appspot.com',
    iosClientId: '1060001868168-d6hufrdmck7r0tcit7qmbitrt2epfoqp.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAMNbNI-MqOLgcROe0fEOUWJ59fB1nVliU',
    appId: '1:1060001868168:ios:1c4d0e158fc9b508cbb23d',
    messagingSenderId: '1060001868168',
    projectId: 'ecommerce-229e7',
    storageBucket: 'ecommerce-229e7.appspot.com',
    iosClientId: '1060001868168-d6hufrdmck7r0tcit7qmbitrt2epfoqp.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceApp',
  );
}
