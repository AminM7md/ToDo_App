import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
      apiKey: "AIzaSyAXjMcJp9u74-XAnL_k2UdN3Nju4Dx7n_0",
      authDomain: "todo-list-19c08.firebaseapp.com",
      projectId: "todo-list-19c08",
      storageBucket: "todo-list-19c08.firebasestorage.app",
      messagingSenderId: "1059640048501",
      appId: "1:1059640048501:web:ad2776210897470460313c",
      measurementId: "G-T9JN4L3E82"
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCxbp2vBom8yM-5GVmVSdT3uBxSB37a8Oo',
    appId: '1:1059640048501:android:cd7943e58a550c1560313c',
    messagingSenderId: '1059640048501',
    projectId: 'todo-list-19c08',
    storageBucket: 'todo-list-19c08.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: '',
    appId: '',
    messagingSenderId: '',
    projectId: '',
    storageBucket: '',
    iosBundleId: '',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: '',
    appId: '',
    messagingSenderId: '',
    projectId: '',
    storageBucket: '',
    iosBundleId: '',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: '',
    appId: '',
    messagingSenderId: '',
    projectId: '',
    authDomain: '',
    storageBucket: '',
    measurementId: '',
  );
}
