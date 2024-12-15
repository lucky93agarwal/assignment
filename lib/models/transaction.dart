class Transaction {
  final int id;
  final String title;

  Transaction({required this.id, required this.title});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      title: json['title'],
    );
  }
}
