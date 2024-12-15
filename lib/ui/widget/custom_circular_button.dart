import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/color.dart';

class CustomCircularButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const CustomCircularButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin:const Alignment(0.00, -1.00),
          end:const Alignment(0, 1),
          colors: [
            Theme.of(context).appSecondColor,
            Theme.of(context).secondAppColor
          ],
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(Get.width * .55, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
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
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
