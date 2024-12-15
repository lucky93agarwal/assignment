import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ExitPopup {
  static Future<void> showExitPopup() async {
    // Show confirmation dialog to exit
    bool? exit = await Get.dialog<bool>(
      AlertDialog(
        title: const Text('Exit'),
        content: const Text('Are you sure you want to exit the app?'),
        actions: [
          TextButton(
            onPressed: () {
              // If user presses 'No', close the dialog and stay in the app
              Get.back(result: false);
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              // If user presses 'Yes', exit the app
              Get.back(result: true);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );

    // If exit is true, close the app
    if (exit == true) {
      // Exit the app
      SystemNavigator.pop();
    }
  }
}
