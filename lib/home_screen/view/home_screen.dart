import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';

import 'widgets/kids_collection.dart';
import 'widgets/latest_collection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 208, 208),
      drawer:  Drawer(
        child: Container(
          color: Colors.red,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blackColor,
        title: const Text("Zara's "),
        actions: const [
          CircleAvatar(
            backgroundColor: Color.fromARGB(255, 243, 176, 224),
            child: Icon(
              Icons.search,
              size: 17,
              color: blackColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 243, 176, 224),
              child: Icon(
                Icons.shop,
                size: 17,
                color: blackColor,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                    'https://images.pexels.com/photos/974911/pexels-photo-974911.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.black,
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.8),
                          Colors.white.withOpacity(.1),
                        ]),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          topLeft: Radius.circular(20),
                        )),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 200, bottom: 10),
                          child: Container(
                            height: 40,
                            width: 50,
                            decoration: const BoxDecoration(
                                // color: Colors.yellow,
                                image: DecorationImage(
                                    image: NetworkImage(
                                      "https://mir-s3-cdn-cf.behance.net/project_modules/fs/ed14aa24668429.5633c06b62a42.jpg",
                                    ),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topLeft: Radius.circular(10),
                                )),
                          ),
                        ),
                        Text("60% off",
                            style: gFont(cl: whiteColor, ls: 2, sz: 30)),
                        Text(
                          "Winter sale offer",
                          style: gFont(
                            cl: whiteColor,
                          ),
                        ),
                        Text(
                          "upto  16 Aug",
                          style: gFont(
                            cl: whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Latest",
                  style: gFontsOleo(cl: blackColor, sz: 25),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "view All",
                    style: gFontsOleo(cl: greyColor, sz: 18),
                  ),
                ),
              ],
            ),
          ),
          LimitedBox(
            maxHeight: 300,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return const LatestCollection();
              },
            ),
          ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10),
             child: Text(
                    "Kids",
                    style: gFontsOleo(cl: blackColor, sz: 25),
                  ),
           ),
          LimitedBox(
            maxHeight: 300,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return const KidsCollection();
              },
            ),
          ),
        ],
      ),
    );
  }
}
