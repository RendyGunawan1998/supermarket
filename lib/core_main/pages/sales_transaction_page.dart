import 'package:intl/intl.dart';
import 'package:supermarket/core.dart';

class SallesTranscationScreen extends StatefulWidget {
  SallesTranscationScreen({super.key});

  @override
  State<SallesTranscationScreen> createState() =>
      _SallesTranscationScreenState();
}

class _SallesTranscationScreenState extends State<SallesTranscationScreen> {
  final SalesTransactionCont controller = Get.put(SalesTransactionCont());
  final SalesReportCont reportCont = Get.put(SalesReportCont());
  final ProductController productCont = Get.put(ProductController());
  final formKey = GlobalKey<FormState>();
  final TextEditingController productIdController = TextEditingController();
  final TextEditingController productnameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final uuid = Uuid();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar('Sales Transaction'),
      body: bodySalesTransaction(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8),
        child: buttonRounded(
          'Add New Transaction',
          () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              hbox(15),
                              textJudulDialog('New Transaction'),
                              hbox(12),
                              dropDownFilter(
                                  'Choose Product',
                                  productCont.productID,
                                  productCont.products.map((x) {
                                    return DropdownMenuItem<String>(
                                      value: x.id,
                                      child: Text(
                                        x.name,
                                        style: gFontInter(Colors.black, 14,
                                            FontWeight.normal),
                                      ),
                                    );
                                  }).toList(), (value) {
                                if (mounted) {
                                  setState(() {
                                    var res = productCont.products
                                        .firstWhere((x) => x.id == value);
                                    print('value :: ${res.name}');
                                    productnameController.text = res.name;
                                    productCont.productID = value;
                                    productIdController.text = value!;
                                  });
                                }
                              }),
                              hbox(6),
                              textFieldWithType(
                                  quantityController,
                                  "Quantity",
                                  TextInputType.numberWithOptions(
                                      decimal: false)),
                              hbox(6),
                              textFieldWithType(
                                  priceController,
                                  "Price",
                                  TextInputType.numberWithOptions(
                                      decimal: false)),
                              hbox(10),
                              rowButtonDialog(context, 'Add', () {
                                print(
                                    'Product ID :: ${productIdController.text}');
                                print(
                                    'Product NAME :: ${productnameController.text}');
                                print(
                                    'Product QTY :: ${quantityController.text}');
                                print(
                                    'Product PRICE :: ${priceController.text}');
                                controller.addNewSalesTranscation(
                                    id: uuid.v4(),
                                    productId: productIdController.text,
                                    quantity:
                                        int.parse(quantityController.text),
                                    price: double.parse(priceController.text) *
                                        10);
                                reportCont.addReport(
                                    name: productnameController.text,
                                    qty: int.parse(quantityController.text),
                                    price: double.parse(priceController.text) *
                                        10);
                                productIdController.clear();
                                productnameController.clear();
                                quantityController.clear();
                                priceController.clear();
                                Navigator.pop(context);
                              }),
                            ],
                          );
                        })),
                  );
                });
          },
        ),
      ),
    );
  }

  Container bodySalesTransaction() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                if (controller.salesTransactionsHistorys.isEmpty) {
                  return noFile('No Sales Transactions...');
                }
                return ListView.builder(
                    itemCount: controller.salesTransactionsHistorys.length,
                    itemBuilder: (context, idx) {
                      var data = controller.salesTransactionsHistorys[idx];
                      var res = productCont.products
                          .firstWhere((x) => x.id == data.productId);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.4),
                                width: 0.4),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              imageProduct(res.name, 0.2),
                              salesTransactionData(
                                  8,
                                  'Name : ${res.name}',
                                  DateFormat("dd MMM yyyy")
                                      .format(data.date)
                                      .toString(),
                                  'Qty : ${data.quantity}'),
                            ],
                          ),
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
