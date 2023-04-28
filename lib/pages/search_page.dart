import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prostore/components/product_tile.dart';
import 'package:prostore/model/api.dart';
import 'package:prostore/model/cart_model.dart';
import 'package:prostore/pages/product_page.dart';
import 'package:provider/provider.dart';

class SeachPage extends StatefulWidget {
  const SeachPage({super.key});

  @override
  State<SeachPage> createState() => _SeachPageState();
}

class _SeachPageState extends State<SeachPage> {
  // TextEditingController controller = TextEditingController();
  // String name='Prabin';
  List _searchedProducts=[];

  @override
  void initState() {
    _searchedProducts=[];
    super.initState();
  }

  void searched(String searched){
    List result=[];
    if(searched.isEmpty){
      result=data;
    }else{
      result=data.where((user) => user[0].toLowerCase().contains(searched.toLowerCase())).toList();
    }
    setState((){
  _searchedProducts=result;
  });
  }

  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              onChanged: (value)=> searched(value),
              decoration: const InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  fillColor: Colors.black,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                      )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              'Searched products',
              style: GoogleFonts.sora(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Divider(
                thickness: 2,
              )),
          
        Expanded(child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GridView.builder(
                      itemCount: _searchedProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, childAspectRatio: 1 / 1.3),
                      itemBuilder: (context, index) {
                        return ProductTile(
                          productName: _searchedProducts[index][0],
                          productPrice: _searchedProducts[index][1],
                          productImgPath: _searchedProducts[index][2],
                          color: _searchedProducts[index][3],
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
                )) 
        ],
      ),
    );
  }
}
