import 'dart:io';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tezda_app/controllers/product_list_controller.dart';
import 'package:tezda_app/main.dart';
import '../modules/product.dart';
import '../modules/user.dart';

String userTableName = 'user';
String productsTableName = 'products';
var controller = Get.put(ProductsListController());

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  String createTableString =
      'CREATE TABLE $userTableName (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, username TEXT,password TEXT,name TEXT,address TEXT,phone TEXT,token TEXT)';

  String messagesTable =
      'CREATE TABLE $productsTableName (id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,price REAL,description TEXT,image TEXT,category TEXT,isLiked TEXT,rate REAL,count INTEGER)';

  Future initDB() async {
    if (Platform.isAndroid || Platform.isIOS) {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, "tezda.db");
      return await openDatabase(path, version: 1, onOpen: (db) {},
          onCreate: (Database db, int version) async {
        await db.execute(createTableString);
        await db.execute(messagesTable);
      });
    }
  }

  Future<User> checkIfUserHasAccount() async {
    final db = await database;
    var result = await db.rawQuery("SELECT * FROM $userTableName");
    if (result.isEmpty) {
      return User(username: '', password: '', token: '');
    }
    Map<String, dynamic> data = Map.of(result[0]);
    var user = User.fromJson(data);

    return user;
  }

  Future<void> deleteUser() async {
    final db = await database;
    await db.rawDelete("DELETE FROM $userTableName");
  }

  Future<void> addUser(User user) async {
    final db = await database;

    try {
      await db.rawQuery("SELECT * FROM $userTableName");
      await db.rawInsert(
          "INSERT Into $userTableName (id,email,username,password,name,address,phone,token)"
          " VALUES (?,?,?,?,?,?,?,?)",
          [
            user.id,
            user.email,
            user.username,
            user.password,
            user.name,
            user.address,
            user.phone,
            user.token
          ]);
    } catch (e) {
      // showSnackbar(e.toString());
    }
  }

  Future<Product> addProduct(Product product) async {
    final db = await database;

    try {
      await db.rawInsert(
          "INSERT Into $productsTableName (id,title,price,description,image,category,rate,count)"
          " VALUES (?,?,?,?,?,?,?,?)",
          [
            product.id,
            product.title,
            product.price,
            product.description,
            product.image,
            product.category,
            product.rate,
            product.count
          ]);
    } catch (e) {
      // print(product);
    }
    return product;
  }

  Future<void> listProduct() async {
    final db = await database;
    var result = await db.rawQuery("SELECT * FROM $productsTableName");
    controller.favorites.clear();
    controller.products.clear();
    for (var i in result) {
      var one = Product.fromJson(Map.of(i));
      controller.updateProductsList(one);
    }
  }

  Future<void> toggleLike(Product product) async {
    final db = await database;
    String value = product.isLiked == 'true' ? 'null' : 'true';
    await db.rawUpdate('''
      UPDATE $productsTableName SET
     isLiked = ?
      WHERE id = ?
      ''', [value, product.id]);
    listProduct();
  }
}
