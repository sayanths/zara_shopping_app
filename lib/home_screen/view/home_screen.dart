import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 208, 208),
      drawer: const Drawer(),
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
      body: Column(
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 250,
                  width: 180,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.network(
                            "https://thumbs.dreamstime.com/b/woman-fashion-long-prom-dress-elegant-girl-blue-ball-gown-clothes-isolated-over-white-83241956.jpg",
                            height: 120),
                      ),
                      height,
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Baby doll",
                                style: gFontsSans(fw: FontWeight.bold),
                              ),
                              const Text(
                                "American brand",
                                style: TextStyle(color: greyColor),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        //  color: blackColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  width,
                                  Container(
                                    height: 40,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      // color: Colors.red,
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
