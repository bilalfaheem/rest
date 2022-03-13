import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/Theme/Theme.dart';
import 'package:restaurant_app/utills/Displaywidth.dart';

Widget Earning_widget1(context) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(left: 20, top: 20),
        alignment: Alignment.centerLeft,
        child: Text(
          "Today",
          style: Constants.blacknormalstyle(),
        ),
      ),
      ListView.builder(
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: ((context, index) {
            return Earning_widget2(context);
          }))
    ],
  );
}

Widget Earning_widget2(context) {
  return Container(
    height: displayHeight(context) * 0.09,
    width: displayWidth(context) / 1.1,
    decoration: Constants.containerstyle(),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 12.0,
            left: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order ID",
                style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(0, 0, 0, 1))),
              ),
              Text(
                "12:32 PM",
                style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(121, 118, 125, 1))),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, right: 30.0),
          child: Text(
            "4654654",
            style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Text(
            "\$12.00",
            style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(94, 207, 99, 1))),
          ),
        ),
      ],
    ),
  );
}
