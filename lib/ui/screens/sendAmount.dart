import 'dart:math';

import 'package:coding_assignment/ui/widget/custom_rounded_button.dart';
import 'package:coding_assignment/ui/widget/vertical_and_horizontal_gap.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:get/get.dart';

class SendAmountScreen extends StatefulWidget {
  const SendAmountScreen({super.key});

  @override
  State<SendAmountScreen> createState() => _SendAmountScreenState();
}

class _SendAmountScreenState extends State<SendAmountScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _amountController.text = "0";
    _confettiController = ConfettiController(duration: Duration(seconds: 4));
  }
  late ConfettiController _confettiController;
  @override
  void dispose() {
    super.dispose();
    _amountController.dispose();
    _confettiController.dispose();
  }

  int btnData = 0;

  final TextEditingController _amountController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Function to handle form submission
  void _submitAmount() {
    if (_formKey.currentState?.validate() ?? false) {
      // If validation is successful, show the bottom sheet
      final overlay = Overlay.of(context);
      final overlay2 = Overlay.of(context);
      final overlayEntry = OverlayEntry(
        builder: (context) => Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _confettiController,
            colors: const [
              Colors.red,
              Colors.blue,
              Colors.orange,
              Colors.purple,
              Colors.lightBlue,
            ],
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            emissionFrequency: 0.05,
            numberOfParticles: 10,
            gravity: 0.2,
            maxBlastForce: 2,
            minBlastForce: 1,
            particleDrag: 0.1,
            createParticlePath: drawStar,
          ),
        ),
      );
      final overlayEntry2 = OverlayEntry(
        builder: (context) => Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _confettiController,
            colors: const [
              Colors.red,
              Colors.blue,
              Colors.orange,
              Colors.purple,
              Colors.lightBlue,
            ],
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            emissionFrequency: 0.05,
            numberOfParticles: 10,
            gravity: 0.2,
            maxBlastForce: 2,
            minBlastForce: 1,
            particleDrag: 0.1,
            createParticlePath: drawStar,
          ),
        ),
      );

      // Insert the overlay entry
      overlay.insert(overlayEntry);
      overlay2.insert(overlayEntry2);
      _confettiController.play();
      Future.delayed(const Duration(seconds: 4), () {
        _confettiController.stop();
        overlayEntry.remove();
      });
      _showBottomSheet('Amount Sent Successfully');
    } else {
      // If validation fails, show the bottom sheet with failure message
      _showBottomSheet('Invalid Amount');
    }
  }

  // Function to show bottom sheet
  void _showBottomSheet(String message) {
    Get.bottomSheet(
      Container(
        width: Get.width,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              message == 'Amount Sent Successfully'
                  ? Icons.check_circle_outline
                  : Icons.error_outline,
              color: message == 'Amount Sent Successfully'
                  ? Colors.green
                  : Colors.red,
              size: 40,
            ),
            const SizedBox(height: 10),
            Text(
              message == 'Amount Sent Successfully'
                  ? "Payment Success!"
                  : message,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            Visibility(
              visible: message == 'Amount Sent Successfully',
              child: Text(
                message == 'Amount Sent Successfully'
                    ? "Your payment has been successfully done."
                    : message,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            Visibility(
              visible: message == 'Amount Sent Successfully',
              child: Container(
                width: Get.width,
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 1,
                color: Colors.grey,
              ),
            ),
            Visibility(
              visible: message == 'Amount Sent Successfully',
              child: Text(
                message == 'Amount Sent Successfully'
                    ? "Total Payment."
                    : message,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            Visibility(
              visible: message == 'Amount Sent Successfully',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Icon(
                      Icons.attach_money,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  Text(
                    _amountController.text,
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.back(); // Close the bottom sheet
              },
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to validate the amount
  String? _validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an amount';
    }
    final amount = double.tryParse(value);
    if (amount == null || amount <= 0) {
      return 'Please enter a valid positive amount';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Transaction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 25.0),
                        child: Icon(
                          Icons.attach_money,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          validator: _validateAmount,
                          decoration: const InputDecoration(
                            border: InputBorder.none, // Removes the border
                          ),
                        ),
                      ),
                    ],
                  ),
                  const VerticalGap(
                    gap: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            btnData = 0;
                          },
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: btnData == 0
                                    ? const Color(0xffEEEEEE)
                                    : null,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "EXPENSES",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            btnData = 1;
                          },
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: btnData == 1
                                    ? const Color(0xffEEEEEE)
                                    : null,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "INCOME",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            btnData = 2;
                          },
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: btnData == 2
                                    ? const Color(0xffEEEEEE)
                                    : null,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "TRANSFER",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900),
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              CustomRoundedButton(
                buttonText: 'Submit',
                onPressed: _submitAmount,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Path drawStar(Size size) {
  // Method to convert degree to radians
  double degToRad(double deg) => deg * (pi / 180.0);

  const numberOfPoints = 5;
  final halfWidth = size.width / 2;
  final externalRadius = halfWidth;
  final internalRadius = halfWidth / 2.5;
  final degreesPerStep = degToRad(360 / numberOfPoints);
  final halfDegreesPerStep = degreesPerStep / 2;
  final path = Path();
  final fullAngle = degToRad(360);
  path.moveTo(size.width, halfWidth);

  for (double step = 0; step < fullAngle; step += degreesPerStep) {
    path.lineTo(halfWidth + externalRadius * cos(step),
        halfWidth + externalRadius * sin(step));
    path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
        halfWidth + internalRadius * sin(step + halfDegreesPerStep));
  }
  path.close();
  return path;
}
