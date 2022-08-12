import 'package:flutter/material.dart';

import '../../../core/color/colors.dart';
import '../../../core/styles/fonts.dart';

class CarosoulSliderHomePage extends StatelessWidget {
  const CarosoulSliderHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
