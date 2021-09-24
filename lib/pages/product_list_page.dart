import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  List productList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductList();
  }

  getProductList() async{
    String path = "http://192.168.1.61:8000/api/product/";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);

    if (response.statusCode == 200) {
      productList = json.decode(response.body);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xFF626262)),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Lista de productos',
            style: TextStyle(
              color: Color(0xFF626262),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.8,
            children: productList.map<Widget>((item){
              return  ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        // height: double.infinity,
                        // margin: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(item['image']),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              spreadRadius: 0.5,
                              blurRadius: 10.0,
                              offset: Offset(0, 5),
                            )
                          ],
                        ),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.center,
                                  colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.more_vert,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item['name'],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                              height: 1.0
                                            ),
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Text(
                                            'S/. ${item['price'].toString()}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
            }).toList(),
            // [
            //   ClipRRect(
            //     borderRadius: BorderRadius.circular(20.0),
            //     child: Container(
            //       // height: double.infinity,
            //       // margin: EdgeInsets.symmetric(horizontal: 10.0),
            //       decoration: BoxDecoration(
            //         image: DecorationImage(
            //           image: NetworkImage(
            //               'https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/05e996e4bc474c278371ad2400c6a5a9_9366/Zapatillas_Grand_Court_Blanco_H02555_01_standard.jpg'),
            //           fit: BoxFit.cover,
            //         ),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.black45,
            //             spreadRadius: 0.5,
            //             blurRadius: 10.0,
            //             offset: Offset(0, 5),
            //           )
            //         ],
            //       ),
            //       child: Stack(
            //         children: [
            //           Container(
            //             decoration: BoxDecoration(
            //               gradient: LinearGradient(
            //                 begin: Alignment.bottomCenter,
            //                 end: Alignment.center,
            //                 colors: [Colors.black.withOpacity(0.8), Colors.transparent],
            //               ),
            //             ),
            //           ),
            //           Align(
            //             alignment: Alignment.topRight,
            //             child: IconButton(
            //               onPressed: () {},
            //               icon: Icon(
            //                 Icons.more_vert,
            //                 color: Colors.black,
            //               ),
            //             ),
            //           ),
            //           Align(
            //             alignment: Alignment.bottomCenter,
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               children: [
            //                 Expanded(
            //                   child: Padding(
            //                     padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
            //                     child: Column(
            //                       mainAxisSize: MainAxisSize.min,
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         Text(
            //                           'Nombreeeeeeeeeeeeeeeee',
            //                           maxLines: 2,
            //                           overflow: TextOverflow.ellipsis,
            //                           style: TextStyle(
            //                             color: Colors.white,
            //                             fontWeight: FontWeight.bold,
            //                             fontSize: 18.0,
            //                             height: 1.0
            //                           ),
            //                         ),
            //                         SizedBox(
            //                           height: 7.5,
            //                         ),
            //                         Text(
            //                           'Descipcion',
            //                           maxLines: 1,
            //                           overflow: TextOverflow.ellipsis,
            //                           style: TextStyle(
            //                             color: Colors.white,
            //                             fontWeight: FontWeight.w500,
            //                             fontSize: 15.0,
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //                 IconButton(
            //                   onPressed: () {},
            //                   icon: Icon(
            //                     Icons.favorite,
            //                     color: Colors.white,
            //                   ),
            //                 )
            //               ],
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ],
          ),
        ));
  }
}
