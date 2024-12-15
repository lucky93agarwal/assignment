import 'dart:math';
import 'package:intl/intl.dart';
import 'package:coding_assignment/constants/color.dart';
import 'package:coding_assignment/controllers/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionScreen extends StatelessWidget {
  final TransactionController transactionController =
      Get.put(TransactionController());

  TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: Obx(
        () {
          if (transactionController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (transactionController.transactions.isEmpty) {
            return const Center(child: Text('No transactions available.'));
          } else {
            return ListView.builder(
              itemCount: transactionController.transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactionController.transactions[index];
                return Card(
                  elevation: 3,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: Icon(
                      Icons.attach_money,
                      color: Theme.of(context).appColor,
                    ),
                    title: Text(
                      '\$${_generateRandomAmount().toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                    subtitle: Text('Transaction ID: ${transaction.id}'),
                    trailing: Text(_generateRandomDate() ),

                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
  String _generateRandomDate() {
    Random random = Random();
    DateTime now = DateTime.now();
    int daysAgo = random.nextInt(180); // Random number of days within the last 6 months
    DateTime randomDate = now.subtract(Duration(days: daysAgo));

    DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm a');
    return formatter.format(randomDate);
  }

  double _generateRandomAmount() {
    Random random = Random();
    return (random.nextDouble() * (5000 - 50) + 50).toDouble();
  }
}
