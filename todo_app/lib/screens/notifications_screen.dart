import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.teal,
            systemNavigationBarColor: Colors.deepOrange),
        backgroundColor: context.theme.backgroundColor,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: const Text(
          "Notification",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w400),
        ),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Column(
            children: const [
              Text(
                "Hello Eslam",
                style: TextStyle(
                    color: darkGreyClr,
                    fontSize: 20,
                    fontFamily: "Island Namina",
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "You have a new reminder",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: primaryClr,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(children: const [
                    Icon(
                      Icons.text_format,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("Title",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w400)),
                  ]),
                  const Text(
                    "You have a new reminder",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(children: const [
                    Icon(
                      Icons.description,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("description",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w400)),
                  ]),
                  const Text(
                    "You have a new reminder",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(children: const [
                    Icon(
                      Icons.alarm_on_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("time",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w400)),
                  ]),
                  const Text(
                    "You have a new reminder",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(children: const [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("date",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w400)),
                  ]),
                  const Text(
                    "You have a new reminder",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          )),
          const SizedBox(
            height: 10,
          ),
        ],
      )),
    );
  }
}
