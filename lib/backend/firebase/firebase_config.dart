import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBFxojAR7l2NB-bPXoj_4n9vZ0YKRN8I70",
            authDomain: "beehive-buzz.firebaseapp.com",
            projectId: "beehive-buzz",
            storageBucket: "beehive-buzz.appspot.com",
            messagingSenderId: "510144120822",
            appId: "1:510144120822:web:aa2d4ee41a5ef6ee2229d7",
            measurementId: "G-KL5Y3Q12DD"));
  } else {
    await Firebase.initializeApp();
  }
}
