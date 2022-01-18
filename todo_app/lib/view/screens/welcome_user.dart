import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/size_config.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/view/screens/home_screen.dart';

class WelcomeToUser extends StatelessWidget {
  const WelcomeToUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: darkHeaderClr,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: AlignmentDirectional.bottomEnd,
                  end: AlignmentDirectional.topStart,
                  stops: const [
                0.0,
                0.5,
                1.0
              ],
                  colors: const [
                Colors.black87,
                Colors.black54,
                Colors.black45
              ])),
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Text(
                  'Welcome to helper mr.Eslam Mongy, let me help you manage your task today',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.balsamiqSans(
                    textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  )),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(2),
                child: Image.asset(
                  "assets/images/doings.png",
                  width: SizeConfig.screenWidth * 0.9,
                  height: SizeConfig.screenWidth * 0.7,
                ),
              ),
              Spacer(),
              SizedBox(
                height: 100,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: orangeClr),
                child: TextButton(
                    onPressed: () {
                      Get.to(HomeScreen());
                    },
                    child: Text('''Let's Go''',
                        style: GoogleFonts.balsamiqSans(
                          textStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ))),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }
}
