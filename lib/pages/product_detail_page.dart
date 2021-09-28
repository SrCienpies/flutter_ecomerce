import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int amount = 0;
  bool canDecrease = false;

  // void ChangeAmount(int value){
  //
  //   amount += value
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF626262)),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Detalle del producto',
          style: TextStyle(
            color: Color(0xFF626262),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      image: DecorationImage(
                        image: NetworkImage(
                            'http://192.168.1.61:8000/media/products/zapatilla_adidas_forum_XzqR9O7.jpg'),
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        "ADIDAS",
                        style: TextStyle(color: Colors.black54, fontSize: 16.0),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        "ZAPATILLAS SUPERCOURT",
                        style: TextStyle(color: Colors.black54, fontSize: 18.0),
                      ),
                    ),
                    Icon(
                      Icons.check_circle,
                      color: Colors.black54,
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "S/ 299.00",
                        style: TextStyle(color: Colors.black54, fontSize: 18.0),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (canDecrease) amount--;
                              amount == 0
                                  ? canDecrease = false
                                  : canDecrease = true;
                              setState(() {});
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: canDecrease
                                    ? Colors.black12
                                    : Color(0x0A000000),
                              ),
                              child: Icon(
                                Icons.remove,
                                color:
                                    canDecrease ? Colors.black : Colors.black12,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              amount.toString(),
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              amount++;
                              amount == 0
                                  ? canDecrease = false
                                  : canDecrease = true;
                              setState(() {});
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black12,
                              ),
                              child: Icon(Icons.add),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        "Descripción general",
                        style: TextStyle(color: Colors.black54, fontSize: 18.0),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'El estilo del tenis llegó a la cima en los años 1970 y su popularidad sigue hasta la actualidad. Inyéctale un poco de energía retro a tu atuendo diario con estas zapatillas adidas. Presentan un exterior de cuero recubierto que les da un acabado prémium y una suela de caucho que complementa el estilo vintage. Lucen estampados de Star Wars™ que le imprimen un toque único.',
                          style:
                              TextStyle(color: Colors.black54, fontSize: 14.0),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 90.0,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  fixedSize: Size(250,50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                ),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.shopping_cart, color: Colors.white,),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Añadir a la cesta',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
