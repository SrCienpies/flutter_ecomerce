import 'dart:io';

import 'package:flutter_codigo3_ecomerce_api/models/product_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBManager {
  // int id;
  // String brand;
  // String name;
  // double price;
  // int quantity;
  // String image;

  static Database? _database;
  static final DBManager db = DBManager._();
  DBManager._();

  Future<Database?> get database async{

    if(_database != null) return _database;
    _database = await initDB();
    return _database;

  }

  initDB() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "ecomerce.db");
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE Products (id INTEGER PRIMARY KEY, brand TEXT, name TEXT, price REAL, quantity INTEGER, image TEXT)');
      },
    );
  }

  Future<int> insertProduct(Product productModel) async {
    final db = await database;
    // int res = await db!.insert("Product", productModel.toJson());
    int res = await db!.rawInsert(
        "INSERT INTO Products(id, brand, name, price, quantity, image) VALUES (${productModel.id}, '${productModel.brand}', '${productModel.name}', ${productModel.price}, ${productModel.quantity}, '${productModel.image}')");
    print(res);
    return res;
  }

  Future<List<Product>> getAllProducts() async{
    final db = await database;
    final res = await db!.query("Products");
    List<Product> listProducts = res.isNotEmpty ? res.map<Product>((item)=>Product.fromJson(item)).toList() : [];
    return listProducts;
  }

  // Future<int> getProductId(int id) async {
  //   final db = await database;
  // }
}