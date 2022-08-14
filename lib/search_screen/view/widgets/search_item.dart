import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  final DocumentSnapshot<Object?> searchData;
  const SearchItem({
    Key? key,
    required this.searchData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            searchData['productName'],
          ),
          subtitle: Text(searchData['brandName']),
          trailing: const Icon(Icons.arrow_upward),
          leading: Image.network(searchData['productImage']),
        ),
      ],
    );
  }
}
