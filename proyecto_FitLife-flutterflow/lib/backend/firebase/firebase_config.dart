import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCPqXRSyK1iIfIZ_v1QILCJxwO5em8WR2E",
            authDomain: "proyecto-fit-life-b90yqb.firebaseapp.com",
            projectId: "proyecto-fit-life-b90yqb",
            storageBucket: "proyecto-fit-life-b90yqb.appspot.com",
            messagingSenderId: "704130844233",
            appId: "1:704130844233:web:b5013714af117a22a1a198"));
  } else {
    await Firebase.initializeApp();
  }
}
