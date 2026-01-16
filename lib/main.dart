// import 'package:dictonary/screens/homepage.dart';
import 'package:dictonary/DataBase/db_init.dart';
import 'package:dictonary/controller/getx_controller.dart';
import 'package:dictonary/screens/splash_screen.dart';
import 'package:dictonary/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/state_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final dbHelper = DbHelper();
  dbHelper.init();
   Get.put(Getx(), permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Getx getx = Get.find<Getx>();
    return Obx(
      () => GetMaterialApp(
        title: 'WordLyric',
        theme: AppTheme.lightTheme,
        darkTheme: getx.isDarkCheck.value
            ? AppTheme.lightTheme
            : AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: Material(child: Splash()),
      ),
    );
  }
}
