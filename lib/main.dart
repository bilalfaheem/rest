import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/main_2.dart';

// import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // SharedPreferences pref = await SharedPreferences.getInstance();
  // var user = pref.containsKey("login");
  // print(user);
  runApp(MaterialApp(
    title: 'Restaurant App',
    home: Main_2(),

    // home: OrderPage(),
    // home: FirstScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
