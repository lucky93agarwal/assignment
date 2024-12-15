import 'package:coding_assignment/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LogoutPopup {

  static Future<void> showLogoutPopup() async {
    final LoginController authController = Get.find<LoginController>();

    // Show confirmation dialog to exit
    await Get.dialog(
      AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () {
              // If user presses 'No', close the dialog and stay in the app
              Get.back(); // Close the dialog
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              // If user presses 'Yes', log out the user
              authController.logout();
              Get.back(); // Close the dialog
            },
            child: const Text('Yes'),
          ),
        ],
      ),
      barrierDismissible: false, // Prevent dismissing the dialog by tapping outside
    );

    // Optional: If you need to handle additional logic after logout, do it here
    // SystemNavigator.pop(); // Uncomment if you want to exit the app after logout
  }
}
