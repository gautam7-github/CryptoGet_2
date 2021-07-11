import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProdiGinix extends StatelessWidget {
  const ProdiGinix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              text: "ProdiGinix",
              children: [
                TextSpan(
                  text: "™",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
              style: GoogleFonts.limelight(
                textStyle: TextStyle(
                  color: Color(0xFFE9A664),
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Text(
            "Software. To The Moon.",
            style: GoogleFonts.antic(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
