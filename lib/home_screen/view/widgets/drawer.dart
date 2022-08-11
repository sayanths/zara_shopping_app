import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: greyColor,
      child: ListView(
        children: [
          Row(
            children: [
              const DrawerHeader(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: yellow,
                ),
              ),
              Container(
                height: 40,
                width: 60,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 222, 200, 0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                child: Center(
                    child: Text(
                  "Log out",
                  textAlign: TextAlign.center,
                  style: gFontsSans(fw: FontWeight.bold),
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
