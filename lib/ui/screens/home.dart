import 'package:coding_assignment/constants/black_and_white_color.dart';
import 'package:coding_assignment/controllers/Internet_controller.dart';
import 'package:coding_assignment/controllers/home_controller.dart';
import 'package:coding_assignment/controllers/login_controller.dart';
import 'package:coding_assignment/core/routing/route_path.dart';
import 'package:coding_assignment/ui/screens/sendAmount.dart';
import 'package:coding_assignment/ui/widget/custom_rounded_button.dart';
import 'package:coding_assignment/ui/widget/logoutPopup.dart';
import 'package:coding_assignment/ui/widget/vertical_and_horizontal_gap.dart';
import 'package:coding_assignment/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});
  final InternetController internetController = Get.put(InternetController());
  final LoginController authController = Get.find<LoginController>();
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed:() =>  LogoutPopup.showLogoutPopup()
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Balance:',
              style:  FontUtilities.h26(fontColor: getBlackAndWhiteColor(),fontWeight: FWT.extraBold),
            ),
            const VerticalGap(gap: 20),
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  controller.isBalanceVisible.value
                      ? '${controller.currentBalance.value.toStringAsFixed(2)} php'
                      : '******',
                  style: FontUtilities.h26(fontColor: getBlackAndWhiteColor(),fontWeight: FWT.extraBold),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: Icon(controller.isBalanceVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    controller.isBalanceVisible.toggle();
                  },
                ),
              ],
            )),

            const VerticalGap(gap: 20),


            CustomRoundedButton(
              buttonText: 'Send Money',
              onPressed: () {
                // loginController.validateLogin();
                Get.toNamed(RoutePath.sendAmount);
              },
            ),

            const VerticalGap(gap: 20),
            CustomRoundedButton(
              buttonText: 'Transactions',
              onPressed: () {
                // loginController.validateLogin();
                Get.toNamed(RoutePath.transaction);
              },
            ),
          ],
        ),
      ),
    );
  }
}
