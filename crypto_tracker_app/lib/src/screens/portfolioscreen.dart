import 'package:flutter/material.dart';

class portfolioScreen extends StatefulWidget {
  portfolioScreen({Key? key}) : super(key: key);

  @override
  _portfolioScreenState createState() => _portfolioScreenState();
}

class _portfolioScreenState extends State<portfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "Dubara check krr, pakka nhi hogi...",
          ),
        ),
      ),
    );
  }
}
