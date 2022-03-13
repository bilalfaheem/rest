import 'package:restaurant_app/Theme/Theme.dart';
import 'package:restaurant_app/utills/Displaywidth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/views/widgets/tab_bar_view.dart';

class OrderDetails extends StatefulWidget {
  String price,
      name,
      date,
      id,
      imagee,
      new_priceee,
      net_amounttt,
      taxxx,
      quantityyy,
      cus_nameee,
      cus_addresss,
      delivert_charr,
      order_statusss;
  OrderDetails(
      {Key? key,
      required this.id,
      required this.name,
      required this.imagee,
      required this.price,
      required this.date,
      required this.new_priceee,
      required this.net_amounttt,
      required this.delivert_charr,
      required this.taxxx,
      required this.quantityyy,
      required this.cus_addresss,
      required this.cus_nameee,
      required this.order_statusss})
      : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  var Status_color = Colors.black;

  void initState() {
    super.initState();
    status_color_check();
  }

  void status_color_check() {
    print("Status _colorCheck");
    if (widget.order_statusss == "Completed") {
      Status_color = Colors.green;
    } else if (widget.order_statusss == "Active") {
      Status_color = Colors.purple;
    } else if (widget.order_statusss == "Scheduled") {
      Status_color = Colors.yellow;
    } else {
      Status_color = Colors.redAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: displayHeight(context) - kBottomNavigationBarHeight,
        width: displayWidth(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
//Order Details Image

              Container(
                // height: displayHeight(context)*0.3,
                width: displayWidth(context),

                decoration: BoxDecoration(

                    // gradient: LinearGradient(
                    //     begin: Alignment.topLeft,
                    //
                    //     end: Alignment.bottomRight,
                    //   colors: [
                    //     Color.fromRGBO(0, 0, 0, 0),
                    //     Color.fromRGBO(0, 0, 0, 0.48),
                    //     Color.fromRGBO(0, 0, 0, 1)
                    //   ],
                    //   stops: [
                    //     0.0,
                    //     0.64,
                    //     1.0,
                    //   ]
                    //   // colors: _colors,
                    //   // stops: _stops,
                    // )
                    ),
                child: Stack(
                  children: [
                    Container(
                      width: displayWidth(context),
                      child: Image.asset(
                        // widget.imagee,
                        "assets/images/foodimages/order_image.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: displayWidth(context),
                      child: Image.asset(
                        "assets/images/foodimages/gradient_image.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Image.asset("assets/images/foodimages/gradient_image.png"),
                    Positioned(
                      top: displayHeight(context) * 0.064,
                      left: displayWidth(context) * 0.066,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                              "assets/images/foodimages/left_arrow.png")),
                    ),
                    Positioned(
                      top: displayHeight(context) * 0.061,
                      left: displayWidth(context) / 3,
                      child: Text(
                        "Order Details",
                        style: GoogleFonts.ubuntu(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: displayHeight(context) * 0.049,
                      right: displayWidth(context) * 0.066,
                      child: Image.asset(
                          "assets/images/foodimages/halal_logo.png"),
                    ),
                    Positioned(
                        top: displayHeight(context) * 0.232,
                        left: displayWidth(context) * 0.040,
                        // bottom: displayHeight(context)*0.049,
                        child: Text(
                          widget.name,
                          style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        )),

//order status

                    Positioned(
                      bottom: displayHeight(context) * 0.049,
                      right: displayWidth(context) * 0.066,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Status_color,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Text(
                          widget.order_statusss,
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.white)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),

//Order Number Cart

              Container(
                height: displayHeight(context) * 0.35,
                width: displayWidth(context) / 1.17,
                decoration: Constants.containerstyle(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Number",
                        style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.5),
                            // Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                        child: Text(
                          widget.id,
                          style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Color.fromRGBO(237, 41, 57, 1),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 22.0),
                        child: Divider(
                          color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.3),
                          height: MediaQuery.of(context).size.height * 0.003,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Text(
                          "From",
                          style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: 16.0, right: 25.0),
                        child: Text(
                          widget.cus_nameee,
                          style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 22.0),
                      //   child: Divider(
                      //     color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.3),
                      //     height: 0.5,
                      //   ),
                      // ),
                      Divider(
                        height: MediaQuery.of(context).size.height * 0.003,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(bottom: 5.0),
                      //child:
                      Text(
                        "Delivery Address",
                        style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      //),
                      // Padding(
                      //   padding:
                      //       const EdgeInsets.only(bottom: 16.0, right: 25.0),
                      //   child:
                      Text(
                        widget.cus_addresss,
                        style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ),
                      //),
                      Padding(
                        padding: const EdgeInsets.only(right: 22.0),
                        child: Divider(
                          color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.3),
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),

//Product Name

              Container(
                height: displayHeight(context) * 0.3,
                width: displayWidth(context) / 1.17,
                decoration: Constants.containerstyle(),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 24.0, right: 22.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${widget.name}",
                            style: GoogleFonts.ubuntu(
                              textStyle: Constants.blackboldstyle(),
                            ),
                          ),
                          Text(
                            "x${widget.quantityyy}",
                            style: GoogleFonts.ubuntu(
                              textStyle: Constants.blackboldstyle(),
                            ),
                          ),
                          Text(
                            "\$ ${widget.new_priceee}",
                            style: GoogleFonts.ubuntu(
                              textStyle: Constants.blackboldstyle(),
                            ),
                          ),
                        ],
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                      //   child: Divider(
                      //     color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.3),
                      //     height: 0.5,
                      //   ),
                      // ),
                      Divider(
                        color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.3),
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sub Total",
                            style: GoogleFonts.ubuntu(
                              textStyle: Constants.blacksmallboldstyle(),
                            ),
                          ),
                          Text(
                            "\$ ${widget.net_amounttt}",
                            style: GoogleFonts.ubuntu(
                              textStyle: Constants.blacksmallboldstyle(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery Fee",
                            style: GoogleFonts.ubuntu(
                              textStyle: Constants.blacksmallboldstyle(),
                            ),
                          ),
                          Text(
                            "\$ ${widget.delivert_charr}",
                            style: GoogleFonts.ubuntu(
                              textStyle: Constants.blacksmallboldstyle(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Incl.Tax",
                            style: GoogleFonts.ubuntu(
                              textStyle: Constants.blacksmallboldstyle(),
                            ),
                          ),
                          Text(
                            "\$ ${widget.taxxx}",
                            style: GoogleFonts.ubuntu(
                              textStyle: Constants.blacksmallboldstyle(),
                            ),
                          ),
                        ],
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 16.0, bottom: 7.0),
                      //   child: Divider(
                      //     color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.3),
                      //     height: 0.5,
                      //   ),
                      // ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total (Incl.Gst)",
                            style: GoogleFonts.ubuntu(
                              textStyle: Constants.blackboldstyle(),
                            ),
                          ),
                          Text(
                            "\$ ${widget.price}",
                            style: GoogleFonts.ubuntu(
                              textStyle: Constants.blackboldstyle(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: TabBarViewData(),
    );
  }
}
