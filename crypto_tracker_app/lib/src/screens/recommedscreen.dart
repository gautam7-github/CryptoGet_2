import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class RecommendationScreen extends StatefulWidget {
  RecommendationScreen({required data}) {
    this.data = data;
  }
  List<dynamic>? data;
  @override
  _RecommendationScreenState createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        backgroundColor: Colors.grey.shade900,
        child: Icon(
          Icons.chevron_left_rounded,
          size: MediaQuery.of(context).size.width / 9,
        ),
      ),
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Text(
                  "CURATED FOR YOU! :D",
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: widget.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Container(
                      padding: EdgeInsets.all(23),
                      child: Center(
                        child: Text(
                          "${widget.data![index].toString().toUpperCase()}",
                          style: GoogleFonts.raleway(
                            textStyle: TextStyle(
                              color: index % 2 == 0 ? Colors.green : Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
