import '../../core.dart';

class SalesReportScreen extends StatefulWidget {
  SalesReportScreen({
    super.key,
  });

  @override
  State<SalesReportScreen> createState() => _SalesReportScreenState();
}

class _SalesReportScreenState extends State<SalesReportScreen> {
  final SalesReportCont salesReportCont = Get.put(SalesReportCont());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar("Sales Report"),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Obx(() {
          if (salesReportCont.reports.isEmpty) {
            return noFile(
                "No sales report available.\nPlease make transaction first...");
          }
          return ListView.builder(
            itemCount: salesReportCont.reports.length,
            itemBuilder: (context, index) {
              final report = salesReportCont.reports[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.4), width: 0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      imageProduct(report.productName, 0.2),
                      salesreport(
                          8,
                          report.productName,
                          'Quantity Sold: ${report.quantity}',
                          'Total: ${report.totalAmount}'),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
