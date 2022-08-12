import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
          subtitle: const Text("category nane"),
          trailing: const Icon(Icons.arrow_upward),
          leading: Image.asset("assets/images/women_pic.png"),
        ),
      ],
    );
  }
}
