import 'package:supermarket/core.dart';

class ProductController extends GetxController {
  var products = <ProductModel>[].obs;
  final productName = "".obs;
  final memo = GetStorage();
  String? productID;

  @override
  void init() {
    super.onInit();
    loadProduct();
  }

  loadProduct() {
    final product = memo.read<List<dynamic>>('products');
    if (product != null) {
      products.value = product
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
    }
  }

  addUpdateNewProduct({
    required String id,
    required String name,
    required double price,
    required int stock,
  }) {
    final index = products.indexWhere((x) => x.id == id);

    if (index >= 0) {
      products[index] =
          ProductModel(id: id, name: name, price: price, stock: stock);
    } else {
      final item = ProductModel(id: id, name: name, price: price, stock: stock);
      products.add(item);
    }
    saveProduct();
  }

  deleteProduct(String id) {
    products.removeWhere((x) => x.id == id);
    saveProduct();
  }

  saveProduct() {
    memo.write('products', products.map((e) => e.toJson()).toList());
  }
}
