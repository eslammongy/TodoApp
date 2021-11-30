import 'dart:async';

import 'package:flutter/material.dart';

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
    /*  timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff363636),
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
                radius: 0.8,
                focalRadius: 0.1,
                colors: [Colors.black, Colors.black45, Colors.black54])),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            const Text(
              'Helper Me',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Island Namina"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            Container(
              padding: EdgeInsets.zero,
              child: Image.asset(
                'assets/images/task_done.gif',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 140,
              ),
            ),
            const Text(
              'Manage Your Task',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Island Namina"),
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
