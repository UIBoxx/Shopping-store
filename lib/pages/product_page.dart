import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prostore/model/cart_model.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  final int index;
  const ProductDetails({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.amber.shade800),
          // title: Text(value.shopProducts[index][0])
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: value.shopProducts[index][3][100],
                    borderRadius: BorderRadius.circular(20)),
                child: Image.asset(
                  value.shopProducts[index][2],
                  height: 250,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(value.shopProducts[index][0],
                      style: GoogleFonts.sora(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber[900],
                      )),
                  Text('\$' + value.shopProducts[index][1],
                      style: GoogleFonts.sora(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[900],
                      )),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20)),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Specifications:',
                            style: GoogleFonts.sora(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(value.shopProducts[index][4],
                            style: GoogleFonts.sora(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          onPressed: () {
                            Provider.of<CartModel>(context, listen: false)
                                .addProductsToCart(index);
                          },
                          color: value.shopProducts[index][3],
                          child: SizedBox(
                            width: 120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('Add to Cart '),
                                Icon(Icons.shopping_bag,size: 20,color:Colors.white,),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      );
    });
  }
}
