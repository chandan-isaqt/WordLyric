import 'package:dictonary/DataBase/db_init.dart';
import 'package:dictonary/controller/getx_controller.dart';
import 'package:dictonary/screens/splash_screen.dart';
import 'package:dictonary/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        debugShowCheckedModeBanner: false,

        // ✅ LIGHT & DARK THEME
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,

        // 🔥 MAIN FIX (IMPORTANT)
        themeMode: getx.isDarkCheck.value
            ? ThemeMode.dark
            : ThemeMode.light,

        // 🔥 FONT FIX (device font OFF)
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: child!,
          );
        },

        home: const Splash(),
      ),
    );
  }
}