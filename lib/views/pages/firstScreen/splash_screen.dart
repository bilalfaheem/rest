import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/Theme/Theme.dart';
import 'package:restaurant_app/utills/Displaywidth.dart';
import 'package:restaurant_app/utills/customtextbutton.dart';
import 'package:restaurant_app/views/pages/signin/sign_in_page.dart';
import 'package:restaurant_app/views/widgets/wavy_first_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            WavyHeaderImage(),
            SizedBox(
              height: displayHeight(context) * 0.35,
            ),
            Container(
              child: CustomTextButton(
                buttonName: 'GET STARTED',
                buttonTextStyle:
                    GoogleFonts.ubuntu(textStyle: Constants.loginbuttonstyle()),
                buttoncolor: Constants.black_light,
                height: _height * 0.066,
                width: displayWidth(context) * 0.9,
                highlightColor: Constants.black_light,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
                textStyle: TextStyle(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
