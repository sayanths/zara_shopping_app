import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/search_screen/view/widgets/search_item.dart';
import 'package:food_delivery/search_screen/view_model/search_controller.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: blackColor,
          title: const Text("Search"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.category),
            ),
          ],
        ),
        body: ListView(
          children: [
            const ListTile(
              title: Text("items"),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: 52,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for the items in the store',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none),
                  fillColor: const Color.fromARGB(255, 209, 207, 207),
                  filled: true,
                  suffixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            height,
            const SearchItem()
          ],
        ));
    //   ),
    // );
  }
}
