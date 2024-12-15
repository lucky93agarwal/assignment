import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/color.dart';

class CustomRoundedButton extends StatelessWidget {
  final String buttonText;
  final void Function() onPressed;
  const CustomRoundedButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .8,
      decoration: BoxDecoration(
        color: (Get.isDarkMode) ? null : Theme.of(context).appColor,
        gradient: (Get.isDarkMode) ? LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).appColor,
            Theme.of(context).secondAppColor
          ],
        ) : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
