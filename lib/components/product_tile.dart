import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductTile extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productImgPath;
  final color;
  void Function()? onPressed;
  void Function()? onTap;

   ProductTile({super.key,
  required this.productName,
  required this.productPrice,
  required this.productImgPath,
  required this.color,
  required this.onPressed,
  required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //images
            GestureDetector(
              onTap: onTap,
              child: Image.asset(productImgPath,
              height: 50,
              ),
            ),
            //name
            GestureDetector(
              onTap: onTap,
              child: Text(productName,style: GoogleFonts.sora(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800
              ),),
            ),
            //price
            Text('\$$productPrice',style: GoogleFonts.sora(
                fontSize: 12,
                color: Colors.grey[900],
              )),
            SizedBox(
              height: 25,
              width: 60,
              child: MaterialButton(onPressed: onPressed,
              color: color,
              child: const Icon(Icons.shopping_bag,size: 20,color:Colors.white,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}