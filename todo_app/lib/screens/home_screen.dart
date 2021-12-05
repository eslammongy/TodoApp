import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/size_config.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/screens/widgets/input_from_field.dart';
import 'package:todo_app/services/theme_services.dart';
import 'widgets/custom__button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                ThemeServices().switchThemeMode();
              },
              icon: const Icon(Icons.brightness_6_outlined)),
          centerTitle: true,
          title: Text(
            "Home",
            style: headingStyle,
          )),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            label: "Click Me",
            onTap: () {
              Get.to(const AddNewTask());
            },
            height: 50,
            width: 150,
          ),
          CustomeInputField(title: "title", hint: "note")
        ],
      )),
    );
  }
}
