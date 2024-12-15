import 'package:coding_assignment/controllers/global_controller.dart';
import 'package:coding_assignment/controllers/login_controller.dart';
import 'package:coding_assignment/core/routing/route_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'utils/route.dart';

void main() async {
  await GetStorage.init(); // Initialize GetStorage
  Get.put(LoginController());
  GlobalController g = Get.put(GlobalController());
  bool? isdark;
  isdark = g.getStorage.read('isDark');
  runApp( MyApp( isDark: isdark ?? false,));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.isDark});
  final bool isDark;
  final LoginController authController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coding Assignment',
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: authController.isLoggedIn ? RoutePath.homeScreen : RoutePath.splash,
      getPages: ScreenRouter.routes,
    );
  }
}

