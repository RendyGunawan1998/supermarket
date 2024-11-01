import '../../core.dart';

class ProductSettingScreen extends StatefulWidget {
  ProductSettingScreen({
    super.key,
  });

  @override
  State<ProductSettingScreen> createState() => _ProductSettingScreenState();
}

class _ProductSettingScreenState extends State<ProductSettingScreen> {
  final ProductController productController = Get.put(ProductController());
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController stock = TextEditingController();
  final uid = Uuid();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar("Product Setting"),
      body: bodyProductSetting(),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(8),
          child: buttonRounded('Add Product', () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => Dialog(
                child: dialogProduct(context, name, price, stock, 'Add Product',
                    () {
                  final id = productController.productID ?? uid.v4();
                  productController.addUpdateNewProduct(
                    id: id,
                    name: name.text,
                    price: double.parse(price.text),
                    stock: int.parse(stock.text),
                  );
                  name.clear();
                  price.clear();
                  stock.clear();
                  productController.productID = null;
                  Navigator.pop(context);
                }),
              ),
            );
          })),
    );
  }

  Container bodyProductSetting() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Expanded(
        child: Obx(() {
          if (productController.products.isEmpty) {
            return noFile(
                'No products available.\nPlease add new product first...');
          } else {
            return ListView.builder(
              itemCount: productController.products.length,
              itemBuilder: (context, index) {
                final product = productController.products[index];
                return Padding(
                  padding: EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.4), width: 0.7),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        imageProduct(product.name, 0.3),
                        productSettingData(
                          7,
                          product.name,
                          'Price : ${product.price}',
                          'Stock : ${product.stock}',
                          () {
                            name.text = product.name;
                            price.text = product.price.toString();
                            stock.text = product.stock.toString();
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => Dialog(
                                child: dialogProduct(context, name, price,
                                    stock, 'Update Product', () {
                                  productController.addUpdateNewProduct(
                                    id: product.id,
                                    name: name.text,
                                    price: double.parse(price.text),
                                    stock: int.parse(stock.text),
                                  );
                                  name.clear();
                                  price.clear();
                                  stock.clear();
                                  productController.productID = null;
                                  Navigator.pop(context);
                                }),
                              ),
                            );
                          },
                          () => productController.deleteProduct(product.id),
                          () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => Dialog(
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      hbox(15),
                                      textJudulDialog('Update Stock'),
                                      hbox(10),
                                      textFieldWithType(stock, 'Stock Qty',
                                          TextInputType.number),
                                      hbox(10),
                                      TextButton(
                                        onPressed: () {
                                          final id =
                                              productController.productID ??
                                                  uid.v4();
                                          productController.addUpdateNewProduct(
                                            id: id,
                                            name: name.text,
                                            price: double.parse(price.text),
                                            stock: int.parse(stock.text),
                                          );
                                          name.clear();
                                          price.clear();
                                          stock.clear();
                                          productController.productID = null;
                                          Navigator.pop(context);
                                        },
                                        child: Text('Update Stock'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                            name.text = product.name;
                            price.text = product.price.toString();
                            stock.text = product.stock.toString();
                            productController.productID = product.id;
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
