import 'package:shoes_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:shoes_store/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: AkAppTheme.lightTheme,
      darkTheme: AkAppTheme.darkTheme,
      home: const OnBoaridngScreen(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}