import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/Theme/Theme.dart';
import 'package:restaurant_app/utills/Displaywidth.dart';

Widget order_tile(context) {
  return Container(
    height: displayHeight(context) / 4.3,
    width: displayWidth(context),
    margin: EdgeInsets.only(
        left: displayWidth(context) * 0.07,
        right: displayWidth(context) * 0.07,
        top: 20),
    decoration: Constants.containerstyle(),
    // color: Color.fromRGBO(255, 255, 255, 1),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order ID",
                style: Constants.orderidstyle(),
              ),
              Text(
                "\$90.00",
                style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(237, 41, 57, 1))),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Divider(
            color: Colors.grey[100],
            thickness: 2,
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sub-Category Name",
                style: Constants.ordersubcategory(),
              ),
              Text("1x", style: Constants.ordersubcategory()),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: displayWidth(context) * 0.78,
          child: Text(
            "10 Paya Lebar Rd, #B1-14 PLQ Mall, Singapore 409057",
            style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(154, 154, 157, 1))),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 5,
            left: 15,
            right: 15,
          ),
          child: Row(
            children: [
              Image.asset("assets/images/timeCircle.png"),
              Text(
                "26-06-2021, 11:00 PM",
                style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(237, 41, 57, 1))),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

class order_tile_class extends StatefulWidget {
  String iid, pprice, ssubname, aadress, qquantity, ddate, oorder_status;

  order_tile_class(
      {Key? key,
      required this.iid,
      required this.pprice,
      required this.ssubname,
      required this.aadress,
      required this.qquantity,
      required this.ddate,
      required this.oorder_status})
      : super(key: key);

  @override
  State<order_tile_class> createState() => _order_tile_classState();
}

class _order_tile_classState extends State<order_tile_class> {
  var Status_color = Colors.black;

  void initState() {
    super.initState();
    status_color_check();
    print("fasdfdskfajfajfadfklaflaflkfasdflasfasfjalsfla");
  }

  void status_color_check() {
    print("Status _colorCheck");
    if (widget.oorder_status == "Scheduled") {
      Status_color = Colors.yellow;
    } else if (widget.oorder_status == "Active") {
      Status_color = Color.fromARGB(251, 155, 39, 176);
    } else {
      Status_color = Color.fromARGB(151, 238, 62, 49);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: orderr(
          context,
          widget.iid,
          widget.pprice,
          widget.ssubname,
          widget.aadress,
          widget.qquantity,
          widget.ddate,
          widget.oorder_status,
          Status_color),
    );
  }
}

Widget orderr(context, id, price, SubName, Address, quantity, date,
    order_status, status_colorr) {
  return Container(
    height: displayHeight(context) / 4.1,
    width: displayWidth(context),
    margin: EdgeInsets.only(
        left: displayWidth(context) * 0.07,
        right: displayWidth(context) * 0.07,
        top: 20),
    decoration: Constants.containerstyle(),
    // color: Color.fromRGBO(255, 255, 255, 1),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order ID $id",
                style: Constants.orderidstyle(),
              ),
              Text(
                "$price",
                style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(237, 41, 57, 1))),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Divider(
            color: Colors.grey[100],
            thickness: 2,
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$SubName",
                style: Constants.ordersubcategory(),
              ),
              Text("${quantity}x", style: Constants.ordersubcategory()),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: displayWidth(context) * 0.78,
          child: Text(
            "$Address",
            style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(154, 154, 157, 1))),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 10,
            left: 15,
            right: 15,
          ),
          child: Row(
            children: [
              Image.asset("assets/images/timeCircle.png"),
              Text(
                "${date}, 11:00 PM",
                style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(237, 41, 57, 1))),
              )
            ],
          ),
        ),
        Container(
          //height: 10,
          margin: EdgeInsets.only(
            top: 5,
            left: 15,
            right: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: status_colorr,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Text(
                  order_status,
                  style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
