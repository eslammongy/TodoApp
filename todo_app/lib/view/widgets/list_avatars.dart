import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/theme.dart';

import 'custom__button.dart';

final listOfAvatares = [
  'assets/avatars/coding.png',
  'assets/avatars/spiderman.png',
  'assets/avatars/superhero_0.png',
  'assets/avatars/superhero_1.png',
  'assets/avatars/superhero_2.png',
  'assets/avatars/superhero_3.png',
  'assets/avatars/superhero_4.png',
  'assets/avatars/superhero_5.png',
  'assets/avatars/superhero_6.png',
  'assets/avatars/superhero_7.png',
  'assets/avatars/superhero_8.png',
  'assets/avatars/superhero_9.png',
];

void displayAvatarDialog(BuildContext context) {
  showGeneralDialog(
      context: context,
      pageBuilder:
          (context, Animation animation, Animation secondaryAnimation) {
        return Container(
          margin: EdgeInsets.symmetric(
              horizontal: (MediaQuery.of(context).size.width * 0.05),
              vertical: MediaQuery.of(context).size.height * 0.10),
          decoration: BoxDecoration(
            color: Get.isDarkMode ? darkGreyClr : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 18,
              ),
              Material(
                color: Get.isDarkMode ? darkGreyClr : Colors.white,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  child: Text(
                    "Choose Your Avatar",
                    textAlign: TextAlign.center,
                    style: subHeadingStyle,
                  ),
                ),
              ),
              Expanded(
                  child: GridView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    height: 60,
                    width: 60,
                    child: Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Image(
                            image: AssetImage(listOfAvatares[index]),
                            width: 50,
                            height: 50,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: listOfAvatares.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                // number of items in your list
              )),
              CustomButton(
                  label: 'Cancel',
                  onTap: () {
                    Navigator.pop(context);
                  },
                  height: 50,
                  width: 100),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      });
}
