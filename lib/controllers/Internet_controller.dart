import 'package:coding_assignment/controllers/transaction_controller.dart';
import 'package:coding_assignment/core/routing/route_path.dart';
import 'package:coding_assignment/ui/screens/noInternet.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
class InternetController extends GetxController {
  var isConnected = false.obs;
  final TransactionController transactionController = Get.put(TransactionController());
  @override
  void onInit() {
    super.onInit();
    _checkInternetConnection();

    ever(isConnected, (_) {


      if (!isConnected.value) {
        Get.to(() => const NoInternetScreen(), preventDuplicates: false);
      } else {
        if (Get.currentRoute == '/NoInternetScreen') {
          Get.back();
        }
        transactionController.fetchTransactions();
      }
    });
  }

  void _checkInternetConnection() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    isConnected.value = (result != ConnectivityResult.none);

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      isConnected.value = (result != ConnectivityResult.none);
    });
  }
}
