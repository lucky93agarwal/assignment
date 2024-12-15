import 'dart:convert';
import 'package:coding_assignment/controllers/transaction_controller.dart';
import 'package:coding_assignment/models/transaction.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  // Fetch transactions from API
  Future<List<Transaction>> fetchTransactions() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;

        return jsonData.map((item) => Transaction.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load transactions');
      }
    } catch (e) {
      debugPrint('API Error: $e');
      rethrow;
    }
  }
}
