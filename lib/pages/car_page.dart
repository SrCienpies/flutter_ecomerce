import 'package:flutter/material.dart';

class CarPage extends StatefulWidget {
  const CarPage({Key? key}) : super(key: key);

  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Color(0xFF626262)),
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'Mi carrito',
              style: TextStyle(
                color: Color(0xFF626262),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(right: 6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        image: DecorationImage(
                          image: NetworkImage('http://192.168.1.61:8000/media/products/zapatilla_adidas_forum_XzqR9O7.jpg'),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Adidas', style: TextStyle(fontSize: 12.0,),),
                          Text('ZAPATILLAS SUPERCOURT',style: TextStyle(fontSize: 13.0,), maxLines: 2, overflow: TextOverflow.ellipsis,),
                          Text('S/ 299.90',style: TextStyle(fontSize: 12.0,),),
                          Text('Remover',style: TextStyle(fontSize: 12.0,decoration: TextDecoration.underline),),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text('Cant.',style: TextStyle(fontSize: 13.0,),),
                        Text('2',style: TextStyle(fontSize: 13.0,),),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Total.',style: TextStyle(fontSize: 13.0,),),
                        Text('S/600',style: TextStyle(fontSize: 13.0,),),
                      ],
                    )
                  ],
                )
              ],
            ),

          ),
        );
  }
}
