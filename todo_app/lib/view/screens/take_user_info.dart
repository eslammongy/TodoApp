import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/view/screens/welcome_user.dart';
import 'package:todo_app/view/widgets/list_avatars.dart';

class TakeUserInfo extends StatelessWidget {
  TakeUserInfo({Key? key}) : super(key: key);
  final textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkHeaderClr,
        body: Container(
          height: double.infinity,
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {
                    Get.to(WelcomeToUser());
                  },
                  child: Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Text('Skip',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.balsamiqSans(
                            textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Choose your avatar',
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
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white),
                      child: CircleAvatar(
                          radius: 60.0,
                          backgroundImage:
                              AssetImage("assets/avatars/coding.png")),
                    ),
                    Positioned(
                      right: 0.0,
                      bottom: 1.0,
                      child: InkWell(
                        onTap: () => displayAvatarDialog(context),
                        child: CircleAvatar(
                          radius: 15.0,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.photo_camera,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 90,
                ),
                Text('Enter your name ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.balsamiqSans(
                      textStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 60,
                  child: TextFormField(
                    controller: textEditingController,
                    autofocus: false,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.orange,
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 1.0)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 1.0)),
                        hintStyle: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                        hintText: "please enter your name"),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: orangeClr),
                  child: TextButton(
                      onPressed: () {},
                      child: Text('Save',
                          style: GoogleFonts.balsamiqSans(
                            textStyle: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ))),
                )
              ],
            ),
          ),
        ));
  }
}
