import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
// import 'package:pinput/pin_put/pin_put.dart';

import 'package:restaurant_app/Models/AuthApi/AuthApiService.dart';
import 'package:restaurant_app/Theme/Theme.dart';
import 'package:restaurant_app/utills/Displaywidth.dart';
import 'package:restaurant_app/utills/customtextbutton.dart';
import 'package:restaurant_app/views/pages/HomeScreen/orders.dart';
import 'package:restaurant_app/views/pages/calling_screen.dart';
import 'package:restaurant_app/views/pages/signin/sign_in_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

var resend_color = Colors.black;

class OTPSCREEN extends StatefulWidget {
  final String phone;
  OTPSCREEN(this.phone);

  // const OTPSCREEN({Key? key}) : super(key: key);

  @override
  _OTPSCREENState createState() => _OTPSCREENState();
}

class _OTPSCREENState extends State<OTPSCREEN> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  // late String _verificationCode;
  late String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final TextEditingController _pin1Controller = TextEditingController();
  final TextEditingController _pin2Controller = TextEditingController();
  final TextEditingController _pin3Controller = TextEditingController();
  final TextEditingController _pin4Controller = TextEditingController();
  final TextEditingController _pin5Controller = TextEditingController();
  final TextEditingController _pin6Controller = TextEditingController();

  final FocusNode _pinPutFocusNode = FocusNode();
  // FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String? _firebaseToken;
  String? _currentTimeZone;

  String pinf = "";

  String pppin = "";
  var _resendToken;
  PinTheme defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  final BoxDecoration pinPutDecoration = BoxDecoration(
    // color: const Color.fromRGBO(255, 255, 255, 1),
    // borderRadius: BorderRadius.circular(10.0),
    border: Border(
      bottom: BorderSide(width: 1, color: Colors.black),
      // color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );

  void resend_timer_function() {
    setState(() {
      if (resendtimer == true) {
        resendtimer = false;
        resend_color = Colors.black;

        print("$resendtimer");
        Timer(
            Duration(seconds: 35),
            () => setState(() {
                  resendtimer = true;
                  resend_color = Colors.red;
                }));
      }
      // if (resendtimer == false) {
      //   Timer(Duration(seconds: 30), (() => resendtimer = true));
      //   print("$resendtimer");
      // } else if (resendtimer == true) {
      //   resendtimer = false;
      //   print("$resendtimer");
    });
  }

  @override
  void initState() {
    super.initState();
    _verifyPhone();

    //remove comment

    // _firebaseMessaging.getToken().then((token) {
    //   _firebaseToken = token;
    // }
    // );
    // _gettimezone();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  // _setUserToken(apikey, profileImage, phoneNumber, name, email, login) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.setString("user_api_token", apikey);
  //   pref.setString('phone_number', phoneNumber);
  //   pref.setString('profile_image', profileImage);
  //   pref.setString('name', name);
  //   pref.setString('email', email);
  //   pref.setString('login', login);
  // }

  // _gettimezone() async {
  //   _currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
  //   // return _currentTimeZone;
  // }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              //remove comment
              // final String _currentTimeZone =
              //     await FlutterNativeTimezone.getLocalTimezone();
              // _firebaseMessaging.getToken().then((token) {
              //   ScaffoldMessenger.of(context)
              //       .showSnackBar(SnackBar(content: Text("/$token")));
              // });
              // ScaffoldMessenger.of(context)
              //     .showSnackBar(SnackBar(content: Text("/$_currentTimeZone")));

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => OrderPage()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("verification Failed.")));
        },
        codeSent: (String verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('code sent section.')));
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 25),
        forceResendingToken: _resendToken);
  }

  // _verifyPhone() async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: widget.phone,
  //       verificationCompleted: null,
  //       verificationFailed: null,
  //       codeSent:

  //        (String verificationID, int resendToken) {
  //         setState(() {
  //           _verificationCode = verificationID;
  //         });
  //       },
  //       codeAutoRetrievalTimeout: (String verificationID) {
  //         setState(() {
  //           _verificationCode = verificationID;
  //         });
  //       },
  //       timeout: Duration(seconds:60));
  // }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Container(
        height: displayHeight(context) / 2,
        width: displayWidth(context),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: displayHeight(context) / 2 * 0.066,
            ),
            Image(image: AssetImage("assets/images/vendor_logo.png")),
            SizedBox(
              height: displayHeight(context) / 2 * 0.066,
            ),
            Text(
              "OTP VERIFICATION" + widget.phone,
              style: GoogleFonts.ubuntu(
                textStyle: Constants.otp1style(),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: displayHeight(context) / 2 * 0.03,
            ),
            Text(
              "Enter the OTP sent on your phone number",
              style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
      //second part of the screen
      Container(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: displayHeight(context) / 2 * 0.12,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
//pin off

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     Container(
                        //       width: displayWidth(context) * 0.12,
                        //       child: TextField(
                        //         controller: _pin1Controller,
                        //         onChanged: (value) {
                        //           pin1 = value;
                        //         },
                        //         maxLength: 1,
                        //         maxLengthEnforced: true,
                        //         decoration: InputDecoration(
                        //             border: UnderlineInputBorder(),
                        //             hintText: "*",
                        //             hintTextDirection: TextDirection.ltr,
                        //             counterText: ''),
                        //         textAlign: TextAlign.center,
                        //       ),
                        //     ),
                        //     // SizedBox(width: 10,),
                        //     Container(
                        //       width: displayWidth(context) * 0.12,
                        //       child: TextFormField(
                        //         controller: _pin2Controller,
                        //         onChanged: (value) {
                        //           pin2 = value;
                        //         },
                        //         maxLength: 1,
                        //         decoration: InputDecoration(
                        //             border: UnderlineInputBorder(),
                        //             hintText: "*",
                        //             hintTextDirection: TextDirection.ltr,
                        //             counterText: ''),
                        //         textAlign: TextAlign.center,
                        //       ),
                        //     ),
                        //     // SizedBox(width: 10,),
                        //     Container(
                        //       width: displayWidth(context) * 0.12,
                        //       child: TextFormField(
                        //         controller: _pin3Controller,
                        //         onChanged: (value) {
                        //           pin3 = value;
                        //         },
                        //         maxLength: 1,
                        //         decoration: InputDecoration(
                        //             border: UnderlineInputBorder(),
                        //             hintText: "*",
                        //             hintTextDirection: TextDirection.ltr,
                        //             counterText: ''),
                        //         textAlign: TextAlign.center,
                        //       ),
                        //     ),
                        //     // SizedBox(width: 10,),
                        //     Container(
                        //       width: displayWidth(context) * 0.12,
                        //       child: TextFormField(
                        //         controller: _pin4Controller,
                        //         onChanged: (value) {
                        //           pin4 = value;
                        //         },
                        //         maxLength: 1,
                        //         decoration: InputDecoration(
                        //             border: UnderlineInputBorder(),
                        //             hintText: "*",
                        //             hintTextDirection: TextDirection.ltr,
                        //             counterText: ''),
                        //         textAlign: TextAlign.center,
                        //       ),
                        //     ),
                        //     Container(
                        //       width: displayWidth(context) * 0.12,
                        //       child: TextFormField(
                        //         controller: _pin5Controller,
                        //         onChanged: (value) {
                        //           pin5 = value;
                        //         },
                        //         maxLength: 1,
                        //         decoration: InputDecoration(
                        //             border: UnderlineInputBorder(),
                        //             hintText: "*",
                        //             hintTextDirection: TextDirection.ltr,
                        //             counterText: ''),
                        //         textAlign: TextAlign.center,
                        //       ),
                        //     ),
                        //     Container(
                        //       width: displayWidth(context) * 0.12,
                        //       child: TextFormField(
                        //         controller: _pin6Controller,
                        //         onChanged: (value) {
                        //           pin6 = value;
                        //         },
                        //         maxLength: 1,
                        //         decoration: InputDecoration(
                        //             border: UnderlineInputBorder(),
                        //             hintText: "*",
                        //             hintTextDirection: TextDirection.ltr,
                        //             counterText: ''),
                        //         textAlign: TextAlign.center,
                        //       ),
                        //     ),
                        //   ],
                        // ),

//remove comment
                        // Padding(
                        //   padding: EdgeInsets.only(
                        //     left: 2.0,
                        //   ),
                        //   child: PinPut(
                        //     // obscureText: "*",
                        //     // hintText: "*",
                        //child: Pinput(
                        // obscureText: "*",
                        // hintText: "*",
                        //     fieldsCount: 6,
                        //     textStyle: const TextStyle(
                        //         fontSize: 25.0, color: Colors.black),
                        //     eachFieldWidth: 40.0,
                        //     eachFieldHeight: 55.0,
                        //     focusNode: _pinPutFocusNode,
                        //     controller: _pinPutController,
                        //     submittedFieldDecoration: pinPutDecoration,
                        //     selectedFieldDecoration: pinPutDecoration,
                        //     followingFieldDecoration: pinPutDecoration,
                        //     pinAnimationType: PinAnimationType.fade,
                        //     onSubmit: (pin) async {
                        //       try {
                        //         await FirebaseAuth.instance
                        //             .signInWithCredential(
                        //                 PhoneAuthProvider.credential(
                        //                     verificationId: _verificationCode,
                        //                     smsCode: pin))
                        //             .then((value) async {
                        //           if (value.user != null) {
                        //             await _firebaseMessaging
                        //                 .getToken()
                        //                 .then((token) {
                        //               ScaffoldMessenger.of(context)
                        //                   .showSnackBar(SnackBar(
                        //                       content: Text("$token")));
                        //             });
                        //             ScaffoldMessenger.of(context).showSnackBar(
                        //                 SnackBar(
                        //                     content:
                        //                         Text("$_currentTimeZone")));
                        //             final services = AuthApiServices();
                        //             services.apiCallLogin(
                        //               {
                        //                 "phone_number": '${widget.phone}',
                        //                 "fcm_token": '$_firebaseToken',
                        //                 "timezone": '$_currentTimeZone',
                        //                 "latitude": '56565.54',
                        //                 "longitude": '65465.164'
                        //               },
                        //             ).then((value) {
                        //               if (value.apitoken != null) {
                        //                 _setUserToken(
                        //                   value.apitoken!,
                        //                   value.profileImage!,
                        //                   value.phoneNumber!,
                        //                   value.name,
                        //                   value.email,
                        //                   value.isLogin,
                        //                 );
                        //                 Navigator.pushAndRemoveUntil(
                        //                     context,
                        //                     MaterialPageRoute(
                        //                         builder: (context) =>
                        //                             OrderPage()),
                        //                     (route) => false);
                        //               } else {
                        //                 ScaffoldMessenger.of(context)
                        //                     .showSnackBar(SnackBar(
                        //                         content: Text(value.error!)));
                        //               }
                        //             });
                        //           }
                        //         });
                        //       } catch (e) {
                        //         FocusScope.of(context).unfocus();
                        //         ScaffoldMessenger.of(context).showSnackBar(
                        //             SnackBar(content: Text('invalid OTP')));
                        //         // _scaffoldkey.currentState!.showSnackBar(
                        //         // SnackBar(content: Text('invalid OTP')));
                        //       }
                        //     },
                        //   ),
                        // ),
// pin put

                        Pinput(
                          length: 6,
                          defaultPinTheme: PinTheme(
                            width: 56,
                            height: 56,
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(30, 60, 87, 1),
                                fontWeight: FontWeight.w600),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Color.fromARGB(255, 162, 182, 199)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          focusedPinTheme: defaultPinTheme.copyDecorationWith(
                            border: Border.all(
                                color: Color.fromARGB(255, 144, 156, 168)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          submittedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration?.copyWith(
                              color: Color.fromRGBO(234, 239, 243, 1),
                            ),
                          ),
                          showCursor: true,
                          onCompleted: (value) => (pinf = value),
                        ),

                        SizedBox(
                          height: displayHeight(context) / 2 * 0.05,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 28),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Didn't received code?",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),

                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    // onPrimary: Colors.amber,
                                    primary: Colors.white,
                                    onSurface: Colors.white,
                                    // Constants.bg_grey,
                                    onPrimary: Colors.red,
                                    animationDuration: Duration(seconds: 5)),

                                onPressed: resendtimer
                                    ? (() => setState(() {
                                          resend_timer_function();
                                          _verifyPhone();
                                        }))
                                    : null,
                                //  resendtimer
                                //     ? () => print("$resendtimer")
                                //     : () => print("$resendtimer"),
                                child: Text(
                                  "resend",
                                  style: TextStyle(color: resend_color),
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {
                              //     _verifyPhone();
                              //     print("verify phone");
                              //   },
                              //   child: Text(
                              //     "resend",
                              //     style: TextStyle(color: Colors.red),
                              //   ),
                              // ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.4,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: CustomTextButton(
                      buttonName: 'VERIFY OTP',
                      buttonTextStyle: GoogleFonts.ubuntu(
                          textStyle: Constants.loginbuttonstyle()),
                      buttoncolor: Constants.black_light,
                      height: _height * 0.066,
                      width: displayWidth(context) * 0.9,
                      highlightColor: Constants.black_light,
                      onPressed: () async {
                        print(pinf);

                        // (pppin) async {
                        try {
                          await FirebaseAuth.instance
                              .signInWithCredential(
                                  PhoneAuthProvider.credential(
                                      verificationId: _verificationCode,
                                      smsCode: pinf))
                              .then((value) async {
                            if (value.user != null) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CallingScreen()),
                                  (route) => false);
                            }
                          });
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Invalid OTP.')));
                          // FocusScope.of(context).unfocus();
                          // _scaffoldkey.currentState
                          //     .showSnackBar(SnackBar(content: Text('invalid OTP')));
                        }

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => OrderPage()),
                        // );
                      },
                      textStyle: TextStyle(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ])));
  }
}
