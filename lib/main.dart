import 'package:flutter/material.dart';
import 'package:MSapp/core/lang/app_translations.dart';
import 'package:MSapp/view/login/view/login_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'view/home/view/home_view.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  runApp(const GetMSappApp());
}

class GetMSappApp extends StatelessWidget {
  const GetMSappApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translationsKeys: AppTranslation.translationKeys,
      locale: Locale('en', 'US'),
      fallbackLocale: Get.deviceLocale,
      enableLog: true,
      navigatorKey: Get.key,
      navigatorObservers: [GetObserver()],
      theme: ThemeData(
        scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(Colors.blue[500]),
        ),
        primarySwatch: Colors.blue,
      ),
      home: LoginView(),
    );
  }
}
