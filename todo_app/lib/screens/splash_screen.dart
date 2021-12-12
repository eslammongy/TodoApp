import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/constants/theme.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: darkGreyClr,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.black54,
              systemNavigationBarColor: Colors.black54)),
      backgroundColor: darkGreyClr,
      body: Container(
        color: darkGreyClr,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            Container(
              padding: EdgeInsets.zero,
              child: Image.asset(
                'assets/images/helper_logo.png',
                fit: BoxFit.contain,
                width: double.infinity,
                height: 150,
              ),
            ),
            const Text(
              'My Helper',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  letterSpacing: 1.0,
                  fontFamily: "Island Namina",
                  fontWeight: FontWeight.w800),
            ),
            const Spacer(),
            const Text(
              'Manage Your Task',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 1.0,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
}
