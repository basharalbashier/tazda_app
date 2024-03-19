import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tezda_app/controllers/db_controller.dart';
import 'package:tezda_app/controllers/product_list_controller.dart';
import 'package:tezda_app/main.dart';
import 'package:tezda_app/pages/login_page.dart';
import 'package:tezda_app/pages/profile_page.dart';
import 'package:tezda_app/widgets/snack_bar.dart';
import '../modules/product.dart';
import '../modules/user.dart';
import '../widgets/products_list_view.dart';
import 'loading_page.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  final controller = Get.put(ProductsListController());
  List<Product> products = [];
  bool showLikedOnly = false;
  User? user;
  getUser() async {
    if (currentUser == null) {
      user = await DBProvider.db.checkIfUserHasAccount();
      print(user);
      setState(() {});
      return;
    }
    user = currentUser;
    setState(() {});
  }

  @override
  void initState() {
    ProductsListController().getProducts();
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    products = showLikedOnly ? controller.favorites : controller.products;
    if (showLikedOnly && controller.favorites.isEmpty) {
      products = controller.products;
      Future.delayed(const Duration(seconds: 1)).then(
          (value) => showSnackbar("You have no favorite products", context));
      showLikedOnly = !showLikedOnly;
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(() =>  ProfilePage(user: user!));
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey,
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      bgList[2],
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () => setState(() => showLikedOnly = !showLikedOnly),
                icon: Icon(Icons.favorite,
                    color: showLikedOnly ? Colors.pink : null)),
            IconButton(
                onPressed: () => _logout(), icon: const Icon(Icons.logout))
          ],
        ),
        body: Obx(() => products.isEmpty
            ? const LoadingListPage()
            : productListView(products, size)));
  }

  _logout() async {
    if (currentUser != null) {
      currentUser = null;
      Get.offAll(() => const LoginScreen());
      return;
    }
    await DBProvider.db.deleteUser();
    Get.offAll(() => const LoginScreen());
  }
}
