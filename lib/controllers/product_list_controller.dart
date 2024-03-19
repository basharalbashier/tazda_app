import 'package:get/get.dart';
import '../helpers/get_request.dart';
import '../modules/product.dart';
import 'db_controller.dart';

class ProductsListController extends GetxController {
  RxList<Product> products = List<Product>.from([]).obs;
  RxList<Product> favorites = List<Product>.from([]).obs;

  updateProductsList(Product product) {
    products.add(product);
    if (product.isLiked == 'true') {
      favorites.add(product);
    }
  }

  void getProducts() async =>
      await httpGetRequest("products", null).then((value) async {
        for (var product in value) {
          product['rate']=double.parse(product['rating']['rate'].toString());
          product['price'] = double.parse(product['price'].toString());
          await DBProvider.db.addProduct(Product.fromJson(product));
        }
        await DBProvider.db.listProduct();
      });
}
