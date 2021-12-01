import 'package:flutter/material.dart';
import 'package:todo_app/screens/notifications_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      child: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const NotificationScreen()));
          },
          child: const Text("Go"),
        ),
      ),
    );
  }
}
