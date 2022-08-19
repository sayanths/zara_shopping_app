import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/botchat/view/chat_bot.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'package:food_delivery/routes/routes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ColoredBox(
      color: const Color.fromARGB(255, 254, 145, 181),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            children: [
              DrawerHeader(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL.toString()),
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
          Container(
            height: 600,
            // height: size.height ,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 222, 220, 220),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                height,
                height,
                const DrawerListTile(
                    title: 'Profile Name',
                    subTitle: 'Check here',
                    icon: Icons.person),
                const DrawerListTile(
                    title: 'My order',
                    subTitle: 'Check here',
                    icon: Icons.shop_outlined),
                const DrawerListTile(
                    title: 'My Delivery Address',
                    subTitle: 'Check here',
                    icon: Icons.location_on_outlined),
                const DrawerListTile(
                    title: 'Refer A Friend',
                    subTitle: 'Check here',
                    icon: Icons.person_outline),
                const DrawerListTile(
                    title: 'Terms and Condition',
                    subTitle: 'Check here',
                    icon: Icons.file_copy_outlined),
                GestureDetector(
                  onTap: () {
                    Routes.push(screen: const ChatBot());
                  },
                  child: const DrawerListTile(
                      title: 'Support',
                      subTitle: 'Check here',
                      icon: Icons.headphones),
                ),
                const DrawerListTile(
                    title: 'About', subTitle: 'Check here', icon: Icons.people),
                height,
                height,
                Text(
                  "zara pvt ltd.",
                  style: gFontsSans(cl: greyColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      subtitle: Text(subTitle),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
