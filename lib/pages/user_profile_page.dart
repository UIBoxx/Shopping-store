import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Icon(
            Icons.location_on,
            color: Colors.grey[700],
          ),
        ),
        title: Text('Location',
            style: GoogleFonts.sora(
              fontSize: 16,
              color: Colors.grey[700],
            )),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(40)),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.person,
                  color: Colors.grey.shade500,
                  size: 30,
                ),
              ),
            ),
            const Gap(5),
            Text('User',
                style: GoogleFonts.sora(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                )),
            const Gap(20),
            Container(
              height: 30,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.amber.shade700,
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                  child: Text(
                'Login',
                style: GoogleFonts.sora(
                  fontSize: 16,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
