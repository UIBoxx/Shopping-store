import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:prostore/components/product_tile.dart';
import 'package:prostore/model/cart_model.dart';
import 'package:prostore/pages/all_product_page.dart';
import 'package:prostore/pages/cart_page.dart';
import 'package:prostore/pages/product_page.dart';
import 'package:prostore/pages/search_page.dart';
import 'package:prostore/pages/user_profile_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex=0;
  
  @override
  Widget build(BuildContext context) {
    List pages= <Widget>[
    const AllProducts(),
    const SeachPage(),
    const CartPage(),
    const UserProfile(),
  ];
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: Padding(
      //     padding: const EdgeInsets.only(left: 24.0),
      //     child: Icon(
      //       Icons.location_on,
      //       color: Colors.grey[700],
      //     ),
      //   ),
      //   title: Text('Location',
      //       style: GoogleFonts.sora(
      //         fontSize: 16,
      //         color: Colors.grey[700],
      //       )),
      //   centerTitle: false,
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //       child: GestureDetector(
      //         onTap: () {
      //           Navigator.push(context, MaterialPageRoute(builder: (context) {
      //             return const UserProfile();
      //           }));
      //         },
      //         child: Container(
      //           decoration: BoxDecoration(
      //               color: Colors.grey.shade300,
      //               borderRadius: BorderRadius.circular(20)),
      //           child: Padding(
      //             padding: const EdgeInsets.all(5.0),
      //             child: Icon(
      //               Icons.person,
      //               color: Colors.grey.shade500,
      //               size: 30,
      //             ),
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      bottomNavigationBar: GNav(
        backgroundColor: Colors.amber.shade800,
        selectedIndex: selectedIndex,
        activeColor: Colors.grey.shade100,
        tabBackgroundColor: const Color.fromARGB(133, 200, 230, 201),
        tabBorderRadius: 10,
        padding: const EdgeInsets.all(15),
        tabMargin: const EdgeInsets.all(5),
        curve: Curves.linear,
        duration : const Duration(seconds: 1),
        onTabChange: (index){
          setState(() {
            selectedIndex=index;
            // print(selectedIndex);
          });
          
        },
        tabs: const [
        GButton(
          icon: Icons.home,
          text: 'Home',
        ),
        GButton(
          icon: Icons.search,
          text: 'Search',
        ),
        GButton(
          icon: Icons.shopping_cart,
          text: 'cart',
        ),
        GButton(
          icon: Icons.person,
          text: 'Profile',
        )
      ]),
      body: pages[selectedIndex],
    );
  }
}
