import 'package:flutter/material.dart';


class SearchItem extends StatelessWidget {
  const SearchItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text(
            "product name",
          ),
          subtitle: const Text("brand nane"),
          trailing: const Icon(Icons.arrow_upward),
          leading: Image.asset("assets/images/women_pic.png"),
        ),
      ],
    );
  }
}
