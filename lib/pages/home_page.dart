import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo3_ecomerce_api/api/api_services.dart';
import 'package:flutter_codigo3_ecomerce_api/models/banner_model.dart';
import 'package:flutter_codigo3_ecomerce_api/pages/car_page.dart';
import 'package:flutter_codigo3_ecomerce_api/pages/product_list_page.dart';
import 'package:http/http.dart' as http;


int _current = 0;
final CarouselController _controller = CarouselController();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<MyBanner> bannerList = [];
  List brandList = [];
  APIService apiService = new APIService();
  List<String> lista = ['uno', 'dos', 'tres'];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData(){
    apiService.getBannerData().then((value) {
      bannerList = value;
      setState(() {});
    });

    apiService.getBrandsData().then((value){
      brandList = value;
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF626262)
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Lentti',
          style: TextStyle(
            color: Color(0xFF626262),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.person),),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) => CartPage(),));
          }, icon: Icon(Icons.shopping_cart),),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    right: 20.0, left: 20.0, top: 5.0, bottom: 20.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45.withOpacity(0.2),
                      blurRadius: 10.0,
                      // spreadRadius: 1.0
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Color(0xffF7F8FA),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0)),
                    hintText: 'Buscar producto',
                    hintStyle: TextStyle(
                      color: Color(0xff9D9EA0),
                    ),
                    suffixIcon: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(17.5),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xffFE744B), Color(0xffFF2C2B)]),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffFE744B).withOpacity(0.75),
                                // color: Colors.black,
                                blurRadius: 7.5,
                                spreadRadius: 0.1)
                          ]),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductListPage(),),);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xffFF7D02),
                                      Color(0xffFFCA53),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffC197FB).withOpacity(0.6),
                                      blurRadius: 7,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child:
                                    Image.asset('assets/images/shoes_icon.png'),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Zapatillas',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.0),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xffFF7D02),
                                    Color(0xffFFCA53),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffC197FB).withOpacity(0.6),
                                    blurRadius: 7,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                  'assets/images/accesory_icon.png'),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Zapatillas',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15.0),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xffFF7D02),
                                    Color(0xffFFCA53),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffC197FB).withOpacity(0.6),
                                    blurRadius: 7,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                'assets/images/tshirt_icon.png',
                                height: 10,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Zapatillas',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              margin:
                                  EdgeInsets.only(right: 12.0, bottom: 12.0),
                              width: 140,
                              height: 76,
                              decoration: BoxDecoration(
                                color: Color(0xffFFEFD6),
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xffFE744B),
                                    Color(0xffFF2C2B)
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffF72727).withOpacity(0.6),
                                    blurRadius: 7,
                                    offset: Offset(0, 4),
                                  )
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  'Lentti',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          Container(
                              margin: EdgeInsets.only(right: 12.0),
                              padding: EdgeInsets.only(left: 16.0),
                              width: 220,
                              height: 75,
                              decoration: BoxDecoration(
                                color: Color(0xffFFEFD6),
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff131416),
                                    Color(0xff3C4043),
                                  ],
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pide tu tarjeta de crédito',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Te devolvemos hasta el 3% de tus compras',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )),
                          Container(
                              margin: EdgeInsets.only(right: 12.0),
                              padding: EdgeInsets.only(left: 16.0),
                              width: 220,
                              height: 75,
                              decoration: BoxDecoration(
                                color: Color(0xffFFEFD6),
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff131416),
                                    Color(0xff3C4043),
                                  ],
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pide tu tarjeta de crédito',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Te devolvemos hasta el 3% de tus compras',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )),
                          Container(
                              margin: EdgeInsets.only(right: 12.0),
                              padding: EdgeInsets.only(left: 16.0),
                              width: 220,
                              height: 75,
                              decoration: BoxDecoration(
                                color: Color(0xffFFEFD6),
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff131416),
                                    Color(0xff3C4043),
                                  ],
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pide tu tarjeta de crédito',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Te devolvemos hasta el 3% de tus compras',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Promociones',
                          style: TextStyle(
                            color: Color(0xffFA4F3E),
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                          height: 180.0,
                          autoPlay: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 1500),
                          onPageChanged: (int index, _) {
                            _current = index;
                            setState(() {});
                          }),
                      items: bannerList.map<Widget>((item) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 0.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22.0),
                            image: DecorationImage(
                                image: NetworkImage(item.image), fit: BoxFit.cover),
                          ),
                        );
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: bannerList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Color(0xfffa4a11))
                                    .withOpacity(
                                        _current == entry.key ? 0.7 : 0.12)),
                          ),
                        );
                      }).toList(),
                    ),

                    //======================== MARCAS

                    SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Marcas',
                          style: TextStyle(
                            color: Color(0xffFA4F3E),
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    GridView.count(
                      primary: true,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      children: List.generate(brandList.length, (index){
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  image: DecorationImage(
                                    image: NetworkImage(brandList[index]['image']),
                                    fit: BoxFit.cover,
                                  )),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment(0, 0.5),
                                            colors: [
                                              Color(0xff121212),
                                              Colors.transparent
                                            ])),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Text(
                                        brandList[index]['brand'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        );
                      }),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
