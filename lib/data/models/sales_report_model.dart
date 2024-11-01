class SalesReportModel {
  final String productName;
  final int quantity;
  final double totalAmount;

  SalesReportModel({
    required this.productName,
    required this.quantity,
    required this.totalAmount,
  });

  Map<String, dynamic> toJson() => {
        'productName': productName,
        'quantity': quantity,
        'totalAmount': totalAmount,
      };

  factory SalesReportModel.fromJson(Map<String, dynamic> json) {
    return SalesReportModel(
      productName: json['productName'],
      quantity: json['quantity'],
      totalAmount: json['totalAmount'],
    );
  }
}
