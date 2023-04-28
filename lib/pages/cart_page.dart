import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prostore/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Consumer<CartModel>(builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Text('My Cart',style: GoogleFonts.sora(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.amber.shade900,
              )),
            ),
            Expanded(child: ListView.builder(
              itemCount: value.cartProducts.length,
              itemBuilder: ((context, index) {
             return Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
               child: Container(
                decoration: BoxDecoration(
                  color: value.cartProducts[index][3][200],
                  borderRadius: BorderRadius.circular(10)
                ),
                 child: ListTile(
                  leading: Image.asset(value.cartProducts[index][2],height: 35,),
                  title: Text(value.cartProducts[index][0],style: GoogleFonts.sora(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              )),
                  subtitle: Text('\$'+value.cartProducts[index][1]),
                  trailing: IconButton(icon: const Icon(Icons.delete),
                   onPressed: ()=>Provider.of<CartModel>(context, listen: false).removeProductFromCart(index),),
                 ),
               ),
             ); 
            }))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.amber.shade800,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('Total Price',style: GoogleFonts.sora(
                          color: Colors.grey.shade700,
                        ),),
                        Text('\$${value.calculateTotal()}',style: GoogleFonts.sora(
                          fontSize: 16,
                          color: Colors.grey.shade100,
                        ))
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(133, 200, 230, 201),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                      children: [
                        Text('Pay Now',style: GoogleFonts.sora(
                          color: Colors.grey.shade100,
                        )),
                        Icon(Icons.arrow_forward_ios,color: Colors.grey.shade100,)
                      ],
                    ))
                  ],
                ),
              ),
            )
          ],
        );
      },),
    );
  }
}