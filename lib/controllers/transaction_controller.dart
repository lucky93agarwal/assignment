import 'package:coding_assignment/transaction/transaction_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/transaction.dart';

class TransactionController extends GetxController {
  var transactions = <Transaction>[].obs;
  var isLoading = false.obs;
  final TransactionService _transactionService = TransactionService();

  @override
  void onInit() {
    super.onInit();
    fetchTransactions();
  }

  // Fetch transactions with offline support
  Future<void> fetchTransactions() async {
    isLoading.value = true;
    try {
      final fetchedTransactions = await _transactionService.fetchTransactions();
      transactions.value = fetchedTransactions;
      saveLocalData(fetchedTransactions);
    } catch (e) {
      await loadLocalData();
    } finally {
      isLoading.value = false;
    }
  }

  // Save data locally
  Future<void> saveLocalData(List<Transaction> fetchedTransactions) async {
    final prefs = await SharedPreferences.getInstance();
    String jsonData = json.encode(fetchedTransactions.map((t) => {'id': t.id, 'title': t.title}).toList());
    await prefs.setString('transactions', jsonData);
  }

  // Load data from local storage
  Future<void> loadLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    String? storedData = prefs.getString('transactions');
    if (storedData != null) {
      var jsonData = json.decode(storedData) as List;
      transactions.value = jsonData.map((item) => Transaction.fromJson(item)).toList();
    }
  }
}
