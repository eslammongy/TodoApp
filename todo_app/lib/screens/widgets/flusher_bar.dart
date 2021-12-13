import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showFlushBar(context, String message, String title) {
  Flushbar(
    mainButton: TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text("Undo",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w600))),
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: Colors.red,
    margin: const EdgeInsets.all(8),
    padding: const EdgeInsets.all(15),
    borderRadius: BorderRadius.circular(10),
    animationDuration: const Duration(seconds: 5),
    duration: const Duration(seconds: 3),
    boxShadows: const [
      BoxShadow(
        color: Colors.black45,
        offset: Offset(3, 3),
        blurRadius: 8,
      ),
    ],
    titleText: Text(
      title,
      style: const TextStyle(
          color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w600),
    ),
    messageText: Text(
      message,
      style: const TextStyle(color: Colors.white, fontSize: 15),
    ),
    icon: Icon(
      Icons.info_outline,
      color: Colors.black87,
    ),
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
  ).show(context);
}
