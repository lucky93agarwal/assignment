import 'dart:async';

import 'package:coding_assignment/core/routing/route_path.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    timer();
  }
  void timer(){
    Timer(const Duration(seconds: 2), () {
      navigateToLoginScreen();
    });
  }

  void navigateToLoginScreen(){
    Get.offAllNamed(RoutePath.login);
  }
}