import 'dart:convert';
import 'package:flutter_codigo3_ecomerce_api/models/banner_model.dart';
import 'package:flutter_codigo3_ecomerce_api/models/product_model.dart';
import 'package:flutter_codigo3_ecomerce_api/utils/constants.dart';
import 'package:http/http.dart' as http;

class APIService{

  Future<List<MyBanner>> getBannerData() async{

    List<MyBanner> myList = [];

    String path = "$pathApi/banner/";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      myList = json.decode(response.body).map<MyBanner>((item)=> MyBanner.fromJson(item)).toList();
    }

    return myList;
  }

  Future<List> getBrandsData() async{

    List myList = [];
    String path = "$pathApi/brand/";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      myList = json.decode(response.body);
    }else{

    }
    return myList;
  }

  Future<List<Product>> getProductsData() async{

    List<Product> myList = [];
    String path = "$pathApi/product/";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      myList = json.decode(response.body).map<Product>((item)=> Product.fromJson(item)).toList();
      print('funciona');
    }

    return myList;
  }

}