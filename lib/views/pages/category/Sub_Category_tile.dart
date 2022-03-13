import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/Theme/Theme.dart';
import 'package:restaurant_app/utills/Displaywidth.dart';
import 'package:restaurant_app/views/pages/category/Categories_Functions.dart';
import 'package:restaurant_app/views/pages/category/categoryPage.dart';

Widget Sub_Category_tile(context, sub_name, sub_detail) {
  return Container(
    //color: Colors.brown,
    height: displayHeight(context) * 0.3,
    width: displayWidth(context) / 2.3,
    child: Stack(
      children: [
        Container(
          decoration: Constants.containerstyle(),
          height: displayHeight(context) * 0.225,
          width: displayWidth(context) / 2.2,
          margin: EdgeInsets.only(
            top: 50,
          ),
        ),
        Positioned(
            top: 5,
            left: displayWidth(context) * 0.09,
            child: Image.asset("assets/images/category_image.png")),
        Positioned(
            top: displayHeight(context) * 0.19,
            left: displayWidth(context) * 0.1,
            child: Center(
              child: Text(
                sub_name,
                style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(0, 0, 0, 1),
                )),
              ),
            )),
        Positioned(
            top: displayHeight(context) * 0.225,
            left: displayWidth(context) * 0.13,
            child: Center(
              child: Text(
                sub_detail,
                style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(237, 41, 57, 1),
                )),
              ),
            )),
      ],
    ),
  );
}

// Trending popluar list view builder
Widget category_tile(context, var name, cat_id) {
  return Container(
    margin: EdgeInsets.only(right: 5),
    child: ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.black))),
        backgroundColor: MaterialStateProperty.all(Colors.black),
      ),
      onPressed: () {
        // Selected_Category_Func(cat_id);
      },
      child: Text(
        name,
        style: GoogleFonts.ubuntu(
            textStyle: TextStyle(
          color: Colors.white,
        )),
      ),
    ),
  );
}

/*margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
    height: displayHeight(Context) * 0.05,
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(0, 0, 0, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 10),
        child: Text(
          "Category1",
          style: GoogleFonts.ubuntu(
              textStyle: TextStyle(
            color: Colors.white,
          )),
        ),
      ),
    ),*/
