import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class portfolioScreen extends StatefulWidget {
  portfolioScreen({Key? key}) : super(key: key);

  @override
  _portfolioScreenState createState() => _portfolioScreenState();
}

class _portfolioScreenState extends State<portfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: Center(
          child: Text(
            "+ Click to Add",
            style: GoogleFonts.raleway(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
