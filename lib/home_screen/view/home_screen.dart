import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 92, 137),
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
                    'https://www.thetimes.co.uk/imageserver/image/%2Fmethode%2Ftimes%2Fprod%2Fweb%2Fbin%2Fce1e9548-6939-11e6-b5c6-db979e28e7a6.jpg?crop=1890%2C1260%2C25%2C7'),
                fit: BoxFit.cover,
              ),
              color: primaryColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        // color: blackColor.withOpacity(.6),
                        gradient: LinearGradient(colors: [
                          Colors.black,
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.8),
                          Colors.white.withOpacity(.1)
                        ]),
                        // boxShadow: [
                        //   BoxShadow(color: Colors.red),
                        // ],
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
                  style: gFontsOleo(cl: whiteColor, sz: 25),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "view All",
                    style: gFontsOleo(cl: whiteColor, sz: 18),
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
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Baby doll",
                              style: gFontsSans(fw: FontWeight.bold),

                            ),
                            Text("American brand"),
                           Container(
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              //color: blackColor
                            ),
                            child: OutlinedButton(
                              onPressed: (){},
                              child:Row(
                                children: [
                                  Text("size"),
                                  Icon(Icons.arrow_drop_down,color: blackColor,),
                                ],

                              )
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
          ),
        ],
      ),
    );
  }
}
