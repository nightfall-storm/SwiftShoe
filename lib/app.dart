import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/general_bindings.dart';
import 'routes/app_routes.dart';
import 'utils/constants/colors.dart';
import 'utils/theme/theme.dart';



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
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      // * Show loader or circular progress indicator until authentication repository decides to show relevant screen
      home: const Scaffold(body: Center(child: CircularProgressIndicator(color: AkColors.primary))),
      debugShowCheckedModeBanner: false,
      
    );
  }
}