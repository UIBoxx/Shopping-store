import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prostore/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber.shade200,
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('lib/images/intro.png')),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Welcome to Pro Store',
                  style: GoogleFonts.sora(
                    fontSize: 40,
                    color: Colors.pink[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Buy your needs now!\nWe deliver your order at your doorstep',
                  style: GoogleFonts.sora(
                    fontSize: 20,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const HomePage();
                    })),
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.amber.shade700,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                          child: Text(
                        'Get Started',
                        style: GoogleFonts.sora(
                          fontSize: 16,
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                  )),
            ]),
      ),
    );
  }
}
