import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoes_store/app.dart';
import 'package:flutter/material.dart';

import 'data/repositories/authentication/authentication_repository.dart';
import 'data/repositories/collections/collection_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // * Add Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // * GetX Local Storage
  await GetStorage.init();

  // * Await Splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // * Initialize Firebase

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  // Only to upload dummy data 
  // Get.put(CollectionRepository());

  runApp(const App());
}
