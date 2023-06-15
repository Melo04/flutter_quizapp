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
///   options: DefaultFirebaseOptions.web,
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
    apiKey: 'AIzaSyDZ7BNShu_ERrU3Da-KVxImyDWGucbbPiE',
    appId: '1:805741337220:web:140b82976985e895e140d1',
    messagingSenderId: '805741337220',
    projectId: 'flutterquiz-f4851',
    authDomain: 'flutterquiz-f4851.firebaseapp.com',
    storageBucket: 'flutterquiz-f4851.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAWkGhLv5MTkkcW5zA_8z99pzyo4CKsjo8',
    appId: '1:805741337220:android:38fc1d5370f990c0e140d1',
    messagingSenderId: '805741337220',
    projectId: 'flutterquiz-f4851',
    storageBucket: 'flutterquiz-f4851.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAvcKrp_y__eDOe2SEP-p1X0-JrMqv0hfY',
    appId: '1:805741337220:ios:b14e5e4b37447153e140d1',
    messagingSenderId: '805741337220',
    projectId: 'flutterquiz-f4851',
    storageBucket: 'flutterquiz-f4851.appspot.com',
    iosClientId: '805741337220-8q7iu87710ib0j74qr14e6a5u8l8qaiq.apps.googleusercontent.com',
    iosBundleId: 'com.example.fluttergdsc',
  );
}
