import 'package:coding_assignment/core/routing/route_path.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{
  var mobileNo = ''.obs;
  var password = ''.obs;
  var errorMobileMessage = ''.obs;
  var errorPasswordMessage = ''.obs;
  final box = GetStorage();
  // Method to check if user is logged in
  bool get isLoggedIn => box.read('isLoggedIn') ?? false;

  // Login method
  void login(String mobileNo, String password) {
    // Example of simple login check
    if (mobileNo == '1234567890' && password == 'password') {
      box.write('isLoggedIn', true); // Save login state
      box.write('mobileNo', mobileNo); // Save mobile number (if needed)
      Get.offAllNamed(RoutePath.homeScreen);
      Get.snackbar('Login', 'Logged in successfully');// Navigate to HomeScreen and remove all previous routes
    } else {
      Get.snackbar('Error', 'Invalid mobile number or password',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Simple validation function
  void validateLogin() {
    if (mobileNo.value.isEmpty) {
      errorMobileMessage.value = 'Please fill in both fields';
    } else if (password.value.isEmpty) {
      errorPasswordMessage.value = 'Please fill in both fields';
    } else if (mobileNo.value.length != 10) {
      errorMobileMessage.value = 'Enter a valid mobile number (10 digits)';
    } else if (password.value.length < 6) {
      errorPasswordMessage.value = 'Password must be at least 6 characters';
    } else {
      errorMobileMessage.value = '';
      errorPasswordMessage.value = '';
      login(mobileNo.value, password.value);
    }
  }

  void logout() {
    box.erase(); // Clear all stored data
    Get.offAllNamed(RoutePath.login); // Navigate back to LoginScreen and remove all previous routes
  }
}