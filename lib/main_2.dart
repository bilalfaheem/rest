import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/views/pages/HomeScreen/orders.dart';
import 'package:restaurant_app/views/pages/calling_screen.dart';
import 'package:restaurant_app/views/pages/firstScreen/splash_screen.dart';

class Main_2 extends StatefulWidget {
  const Main_2({Key? key}) : super(key: key);

  @override
  State<Main_2> createState() => _Main_2State();
}

class _Main_2State extends State<Main_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // CallingScreen()
          FirebaseAuth.instance.currentUser == null
              ? FirstScreen()
              : CallingScreen(),
    );
  }
}
