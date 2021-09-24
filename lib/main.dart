import 'package:flutter/material.dart';
import 'package:flutter_codigo3_ecomerce_api/pages/home_page.dart';
import 'package:flutter_codigo3_ecomerce_api/pages/product_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListPage(),
    );
  }
}
