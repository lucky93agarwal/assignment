import 'dart:async';

import 'package:coding_assignment/controllers/Internet_controller.dart';
import 'package:coding_assignment/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  SplashScreen({super.key});
  final InternetController internetController = Get.put(InternetController());
  final SplashController splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    controller.timer();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (!internetController.isConnected.value) {
          return const Center(child: CircularProgressIndicator()); // Show loading while checking
        } else {
          return Center(
            child: Image.asset('assets/icons/logo.png', width: 150), // Your splash image/logo
          );
        }
      })
    );
  }
}
