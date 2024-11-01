import 'package:supermarket/core.dart';

class SalesReportCont extends GetxController {
  var reports = <SalesReportModel>[].obs;
  final memo = GetStorage();

  @override
  void init() {
    super.onInit();
    loadReport();
  }

  loadReport() {
    final report = memo.read<List<dynamic>>('reports');
    if (report != null) {
      reports.value = report
          .map<SalesReportModel>((json) => SalesReportModel.fromJson(json))
          .toList();
    }
  }

  addReport({
    required String name,
    required int qty,
    required double price,
  }) {
    final totalPrice = qty * price;
    print('Total price report :: $totalPrice');
    final report = SalesReportModel(
      productName: name,
      quantity: qty,
      totalAmount: totalPrice,
    );
    reports.add(report);
    saveReport();
    Get.snackbar('Success', 'Report from $name sale recorded successfully.');
  }

  saveReport() {
    memo.write('reports', reports.map((e) => e.toJson()).toList());
  }
}
