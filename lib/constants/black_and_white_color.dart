import 'package:flutter/material.dart';
import 'package:get/get.dart';

getBlackAndWhiteColor() {
  return Get.isDarkMode ? Colors.white : Colors.black;
}
getBlackAndWhiteColorTwo() {
  return Get.isDarkMode ? Colors.white.withOpacity(0.699999988079071) : Colors.black;
}

const lightModeOrangeColor = Color(0xfff95a00);
