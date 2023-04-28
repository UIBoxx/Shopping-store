import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prostore/components/product_tile.dart';
import 'package:prostore/model/cart_model.dart';
import 'package:prostore/pages/product_page.dart';
import 'package:provider/provider.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            //greetings
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Good Morning',
                style: GoogleFonts.sora(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ),
            const Gap(10),
            //greetings
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Let\'s find you a best products',
                style: GoogleFonts.sora(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber[900],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                'All products',
                style: GoogleFonts.sora(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
            ),
            Expanded(child: Consumer<CartModel>(
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GridView.builder(
                      itemCount: value.shopProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, childAspectRatio: 1 / 1.3),
                      itemBuilder: (context, index) {
                        return ProductTile(
                          productName: value.shopProducts[index][0],
                          productPrice: value.shopProducts[index][1],
                          productImgPath: value.shopProducts[index][2],
                          color: value.shopProducts[index][3],
                          onPressed: () {
                            Provider.of<CartModel>(context, listen: false)
                                .addProductsToCart(index);
                          },
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProductDetails(
                                index: index,
                              );
                            }));

                            // print('Tapped-'+index.toString());
                          },
                        );
                      }),
                );
              },
            )),
            const Gap(10),
          ],
        ),
      );
  }
}