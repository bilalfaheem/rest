import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/Theme/Theme.dart';
import 'package:restaurant_app/utills/Displaywidth.dart';
import 'package:restaurant_app/views/pages/orderHistory/orderDetails.dart';

class Order_history_tile_class extends StatefulWidget {
  String Cat_nam,
      prod_nam,
      ppricee,
      ddatee,
      iidd,
      iimagee,
      nnew_pricee,
      nnet_amountt,
      ttaxx,
      qquantityy,
      ccus_namee,
      ccus_address,
      ddelivert_char,
      oorder_statuss;
  Order_history_tile_class(
      {Key? key,
      required this.Cat_nam,
      required this.prod_nam,
      required this.ppricee,
      required this.ddatee,
      required this.iidd,
      required this.iimagee,
      required this.nnew_pricee,
      required this.nnet_amountt,
      required this.ttaxx,
      required this.qquantityy,
      required this.ccus_namee,
      required this.ccus_address,
      required this.ddelivert_char,
      required this.oorder_statuss})
      : super(key: key);

  @override
  State<Order_history_tile_class> createState() =>
      _Order_history_tile_classState();
}

class _Order_history_tile_classState extends State<Order_history_tile_class> {
  var Status_color = Colors.black;

  void initState() {
    // super.initState();
    status_color_check();
    print("status color check historyyyyyyyyyyyyyyyyyyyyyyyy");
  }

  void status_color_check() {
    print("Status _colorCheck");
    if (widget.oorder_statuss == "Completed") {
      Status_color = Color.fromARGB(169, 76, 175, 79);
    } else if (widget.oorder_statuss == "Active") {
      Status_color = Color.fromARGB(166, 155, 39, 176);
    } else if (widget.oorder_statuss == "Scheduled") {
      Status_color = Color.fromARGB(255, 255, 223, 81);
    } else {
      Status_color = Color.fromARGB(151, 238, 62, 49);
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
        child: order_history_tile(
            context,
            Status_color,
            widget.Cat_nam,
            widget.prod_nam,
            widget.ppricee,
            widget.ddatee,
            widget.iidd,
            widget.iimagee,
            widget.nnew_pricee,
            widget.nnet_amountt,
            widget.ttaxx,
            widget.qquantityy,
            widget.ccus_namee,
            widget.ccus_address,
            widget.ddelivert_char,
            widget.oorder_statuss)));
  }
}

Widget order_history_tile(
    context,
    status_ccolor,
    Cat_name,
    prod_name,
    pricee,
    datee,
    idd,
    iimage,
    new_pricee,
    net_amountt,
    taxx,
    quantityy,
    cus_namee,
    cus_address,
    delivert_char,
    order_statuss) {
  return (GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetails(
              id: idd,
              name: prod_name,
              imagee: iimage,
              price: pricee,
              date: datee,
              new_priceee: new_pricee,
              net_amounttt: net_amountt,
              delivert_charr: delivert_char,
              taxxx: taxx,
              quantityyy: quantityy,
              cus_addresss: cus_address,
              cus_nameee: cus_namee,
              order_statusss: order_statuss,
            ),
          ));
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 25),
      height: displayHeight(context) * 0.14,
      width: displayWidth(context) / 1.17,
      decoration: Constants.containerstyle(),
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 8.0),
                child: Image.asset("assets/images/foodimages/kfc.png"),
              ),
            ],
          ),
          SizedBox(
            width: displayWidth(context) * 0.035,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Cat_name,
                  style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.008,
                ),
                Text(
                  prod_name,
                  style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color.fromRGBO(154, 154, 157, 1),
                  )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Text(
                  "$datee, 22:32",
                  style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color.fromRGBO(154, 154, 157, 1),
                  )),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: displayWidth(context) * 0.08,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 20),
                child: Text(
                  "\$ $pricee",
                  style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(237, 41, 57, 1),
                  )),
                ),
              ),

//Order Status

              Padding(
                padding: const EdgeInsets.only(bottom: 15.0, right: 20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: status_ccolor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    order_statuss,
                    style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 9.7,
                            color: Colors.white)),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
  ));
}
