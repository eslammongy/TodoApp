import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key, required this.payload}) : super(key: key);
  final String payload;
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final String _payload = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios)),
          centerTitle: true,
          title: Text(
            "Notification",
            style: headingStyle,
          )),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Text(
                "Hello eslam",
                style: subHeadingStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "You have a new reminder",
                style: titleStyle,
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
                  Row(children: [
                    Icon(
                      Icons.text_format,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(_payload.toString().split("|")[0],
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
                  Row(children: [
                    Icon(
                      Icons.description,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(_payload.toString().split("|")[1],
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
                  Row(children: [
                    Icon(
                      Icons.alarm_on_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(_payload.toString().split("|")[2],
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
