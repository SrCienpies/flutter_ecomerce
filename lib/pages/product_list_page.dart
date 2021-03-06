import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_codigo3_ecomerce_api/api/api_services.dart';
import 'package:flutter_codigo3_ecomerce_api/models/product_model.dart';
import 'package:flutter_codigo3_ecomerce_api/pages/product_detail_page.dart';
import 'package:http/http.dart' as http;

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  APIService apiService = new APIService();
  List<Product> listProduct = [];

  @override
  initState() {
    super.initState();
    getData();
  }

  getData(){
    this.apiService.getProductsData().then((value){
      listProduct = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text(
          "Lista de productos",
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w900,
              fontFamily: 'Comfortaa-Bold',
              fontSize: 16.0),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        // crossAxisSpacing: 10,
        children: listProduct
            .map<Widget>(
              (e) => GestureDetector(
            onTap: () {
              print(e);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                    sneaker:  e,
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                children: [
                  Container(
                    height: 160.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.transparent,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(e.image),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 10.0,
                          top: 10.0,
                          child: Icon(
                            Icons.more_vert,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.name.toString().toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff121212),
                                    fontSize: 13.0,
                                    height: 1.2),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "S/ ${e.price}",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12.0,
                                    color: Color(0xff121212)),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.favorite_border)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
            .toList(),
      ),
    );
  }
}