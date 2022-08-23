import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/over_view/view/over_view.dart';
import 'package:food_delivery/routes/routes.dart';
import '../../../core/color/colors.dart';
import '../../../core/styles/fonts.dart';

class LatestCollection extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> newdatas;

  const LatestCollection({Key? key, required this.newdatas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
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
                  child: InkWell(
                    onTap: () => Routes.push(
                        screen: ProductOverView(data: newdatas)),
                    child: Image.network(newdatas['productImage'], height: 120),
                  ),
                ),
                height,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newdatas['productName'],
                          style: gFontsSans(fw: FontWeight.bold),
                        ),
                        Text(
                          newdatas['brandName'],
                          style: const TextStyle(color: greyColor),
                        ),
                        height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RatingBar.builder(
                              initialRating: newdatas['productRating'],
                              itemSize: 15,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                if (kDebugMode) {
                                  print(rating);
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
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
