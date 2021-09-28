import 'dart:convert';
import 'package:flutter_codigo3_ecomerce_api/utils/constants.dart';
import 'package:http/http.dart' as http;

class APIService{

  Future<List> getBannerData() async{

    List myList = [];

    String path = "$pathApi/banner/";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      myList = json.decode(response.body);
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

  Future<List> getProductsData() async{

    List myList = [];
    String path = "$pathApi/product/";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      myList = json.decode(response.body);
    }
    return myList;
  }

}