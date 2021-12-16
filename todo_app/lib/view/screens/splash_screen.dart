import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/view/screens/take_user_info.dart';

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
          context, MaterialPageRoute(builder: (context) => TakeUserInfo()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black54,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: darkGreyClr,
              systemNavigationBarColor: darkGreyClr)),
      backgroundColor: darkGreyClr,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black54,
          /*  gradient: LinearGradient(
                begin: AlignmentDirectional.bottomEnd,
                end: AlignmentDirectional.topStart,
                stops: const [0.0, 0.5, 1.0],
                colors: const [Colors.black87, darkGreyClr, Colors.black38]) */
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.16,
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
