import 'package:supermarket/core.dart';

class SalesTransactionCont extends GetxController {
  var salesTransactionsHistorys = <TransactionModel>[].obs;
  final memo = GetStorage();

  @override
  void init() {
    super.onInit();
    loadSalesTransactionHistory();
  }

  addNewSalesTranscation({
    required String id,
    required String productId,
    required int quantity,
    required double price,
  }) {
    final salesTransactionsHistory = TransactionModel(
      id: id,
      productId: productId,
      quantity: quantity,
      totalPrice: price,
      date: DateTime.now(),
    );

    salesTransactionsHistorys.add(salesTransactionsHistory);
    memo.write('sales_transcations',
        salesTransactionsHistorys.map((e) => e.toJson()).toList());
  }

  loadSalesTransactionHistory() {
    final getSalestransactionHistory =
        memo.read<List<dynamic>>('sales_transcations') ?? [];
    if (getSalestransactionHistory.isNotEmpty) {
      salesTransactionsHistorys.value = getSalestransactionHistory
          .map<TransactionModel>((json) => TransactionModel.fromJson(json))
          .toList();
    }
  }
}
