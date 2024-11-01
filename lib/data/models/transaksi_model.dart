import '../../core.dart';

class TransactionModel {
  final String id;
  final String productId;
  final int quantity;
  final double totalPrice;
  final DateTime date;

  TransactionModel({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.totalPrice,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'quantity': quantity,
      'totalPrice': totalPrice,
      'date': date.toIso8601String(),
    };
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      productId: json['productId'],
      quantity: json['quantity'],
      totalPrice: json['totalPrice'],
      date: DateTime.parse(json['date']),
    );
  }

  static String encode(List<TransactionModel> transactions) => json.encode(
        transactions.map((transaction) => transaction.toJson()).toList(),
      );

  static List<TransactionModel> decode(String transactions) =>
      (json.decode(transactions) as List<dynamic>)
          .map<TransactionModel>((item) => TransactionModel.fromJson(item))
          .toList();
}
