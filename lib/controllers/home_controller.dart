import 'package:coding_assignment/core/routing/route_path.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController{
  RxDouble currentBalance = 500.00.obs;
  RxBool isBalanceVisible = false.obs;
}