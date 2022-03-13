import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/views/pages/accountSetting/accountSetting.dart';
import 'package:restaurant_app/views/pages/category/categoryPage.dart';
import 'package:restaurant_app/views/pages/earning/earning.dart';
import 'package:restaurant_app/views/pages/orderHistory/orderHistory.dart';

Widget Drawer_widget(context) {
  return ListView(padding: EdgeInsets.all(10.0),
      // children: _listViewData
      //     .map((data) => ListTile(
      //           title: Text(data),
      //         ))
      //     .toList(),
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountSetting()),
                      );
                    },
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Image(image: AssetImage("assets/images/Wallet.png")),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Account Setting",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.black,
                            ))),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        // Text("\$87.00",
                        //     style: GoogleFonts.ubuntu(
                        //         textStyle: TextStyle(
                        //       fontWeight: FontWeight.w500,
                        //       fontSize: 17,
                        //       color: Colors.red,
                        //     ))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    child: Divider(
                      color: Colors.grey[100],
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  // 2nd
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrdersHistory()),
                      );
                    },
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Image(image: AssetImage("assets/images/Bag.png")),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Order History",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.black,
                            ))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Divider(
                      color: Colors.grey[100],
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),

                  // 3rd
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CategoryPage()),
                      );
                    },
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Image(image: AssetImage("assets/images/Bag.png")),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Category",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.black,
                            ))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Divider(
                      color: Colors.grey[100],
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  // 4th
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Earning()),
                      );
                    },
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Image(image: AssetImage("assets/images/Bag.png")),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Earnings",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.black,
                            ))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Divider(
                      color: Colors.grey[100],
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                ],
              ),
            ))
      ]);
}
