import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/search_screen/view/widgets/search_item.dart';
import 'package:food_delivery/search_screen/view_model/search_controller.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String productName = '';
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
      body: Column(
        children: [
          const ListTile(
            title: Text("items"),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: 52,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  productName = value;
                });
              },
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
          StreamBuilder<QuerySnapshot>(
              stream: (productName != "")
                  ? FirebaseFirestore.instance
                      .collection('LatestModel')
                      .where('productName', isGreaterThanOrEqualTo: productName)
                      .where('productName', isLessThan: '${productName}z')
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection("LatestModel")
                      .snapshots(),
              builder: ((context, snapshot) {
                return (snapshot.connectionState == ConnectionState.waiting)
                    ? const Center(
                        child: CupertinoActivityIndicator(),
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              DocumentSnapshot data =
                                  snapshot.data!.docs[index];
                              return SearchItem(searchData: data);
                            }),
                      );
              }))
        ],
      ),
    );
  }
}
