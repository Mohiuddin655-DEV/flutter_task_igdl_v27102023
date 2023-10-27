import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'res/localization/languages.dart';
import 'res/routes/routes.dart';
import 'utils/dependency_injection.dart';

Future<void> main() async {
  await diInit();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter MVVM Architecture with GetX',
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppRoutes.routes(),
    );
  }
}
