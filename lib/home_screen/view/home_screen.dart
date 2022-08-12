import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'package:food_delivery/home_screen/view/widgets/drawer.dart';
import 'package:food_delivery/home_screen/view_model/product_controller.dart';
import 'package:food_delivery/review_cart/view/review_cart.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:food_delivery/search_screen/view/search_screen.dart';
import 'package:provider/provider.dart';

import 'widgets/carsoul_slider.dart';
import 'widgets/kids_collection.dart';
import 'widgets/latest_collection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pov = context.read<ProductController>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 208, 208),
      drawer: const Drawer(
        child: CustomDrawer(),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blackColor,
        title: const Text("Zara's "),
        actions: [
          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 247, 200, 234),
            child: IconButton(
              onPressed: () {
                Routes.push(screen: const SearchScreen());
              },
              icon: const Icon(
                Icons.search,
                color: blackColor,
                size: 17,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 247, 189, 230),
              child: IconButton(
                onPressed: () {
                  Routes.push(screen: const ReviewCart());
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: blackColor,
                  size: 17,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          const CarosoulSliderHomePage(),
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
                    style: gFontsOleo(cl: blackColor, sz: 18),
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

