import 'package:firebase_core/firebase_core.dart';
import 'package:shoes_store/app.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  // * Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const App());
}
