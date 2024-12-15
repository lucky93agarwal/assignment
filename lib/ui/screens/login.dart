import 'package:coding_assignment/constants/color.dart';
import 'package:coding_assignment/constants/images.dart';
import 'package:coding_assignment/controllers/login_controller.dart';
import 'package:coding_assignment/ui/widget/custom_rounded_button.dart';
import 'package:coding_assignment/ui/widget/exitPopup.dart';
import 'package:coding_assignment/ui/widget/vertical_and_horizontal_gap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController>  {
  LoginScreen({super.key});
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
        // Show exit popup when back button is pressed
        await ExitPopup.showExitPopup();
        return false; // Prevent default back behavior
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: ListView(
          children: [
            SizedBox(
              height: Get.height*0.9,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/logo.png', width: 150),
                        const VerticalGap(gap: 15),
                        Text(
                          'Welcome To Assignment Family!',
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).textColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const VerticalGap(gap: 15),
                        Text("Log In",
                          style: TextStyle(
                            fontSize: 25,
                            color: Theme.of(context).textColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const VerticalGap(gap: 36),

                        Obx(() {
                          return TextFormField(
                            keyboardType: TextInputType.phone,
                            style:const TextStyle(fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              hintText: 'Enter Your Mobile Number',
                              hintStyle: TextStyle(
                                  color: Theme.of(context).appColor
                              ),
                              floatingLabelStyle: TextStyle(color:Theme.of(context).appColor),
                              labelText: 'Mobile Number',
                              border: const OutlineInputBorder(),
                              errorText: loginController.errorMobileMessage.value.isEmpty ? null : loginController.errorMobileMessage.value,
                              suffixIcon:const Icon(Icons.phone),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Theme.of(context).appColor), // Border color when focused
                              ),
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),  // Restrict to 10 digits
                            ],

                            onChanged: (value) {
                              loginController.mobileNo.value = value;
                            },
                          );
                        }),
                        const VerticalGap(gap: 16),
                        Obx(() {
                          return TextFormField(
                            obscureText: !loginController.password.value.endsWith("👁️"),
                            style:const TextStyle(fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              hintText: 'Enter Your Password',
                              hintStyle: TextStyle(
                                  color: Theme.of(context).appColor
                              ),
                              labelText: 'Password',
                              floatingLabelStyle: TextStyle(color:Theme.of(context).appColor),
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  loginController.password.value.endsWith("👁️") ? Icons.visibility : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  // Toggle password visibility
                                  if (loginController.password.value.endsWith("👁️")) {
                                    loginController.password.value = loginController.password.value.substring(0, loginController.password.value.length - 1);
                                  } else {
                                    loginController.password.value += "👁️";
                                  }
                                },
                              ),
                              errorText: loginController.errorPasswordMessage.value.isEmpty ? null : loginController.errorPasswordMessage.value,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Theme.of(context).appColor), // Border color when focused
                              ),
                            ),
                            onChanged: (value) {
                              loginController.password.value = value;
                            },
                          );
                        }),
                        const VerticalGap(gap: 36),
                        CustomRoundedButton(
                          buttonText: 'Submit',
                          onPressed: () {
                            loginController.validateLogin();
                          },
                        ),
                        const VerticalGap(gap: 20),
                        Text("I forgot my password",style: TextStyle(
                            color: Theme.of(context).appColor,
                            fontWeight: FontWeight.bold
                        ),)
                    ],),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       const Text("Please try our services?",style: TextStyle(fontSize: 15),),
                        const VerticalGap(gap: 5),
                        Text("here you are",style: TextStyle(
                            color: Theme.of(context).appColor,
                            fontWeight: FontWeight.bold,
                        ),),
                        Container(width: 80,height: 2,color:  Theme.of(context).appColor,)
                      ],),

                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
