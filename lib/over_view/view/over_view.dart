import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'package:food_delivery/home_screen/view_model/product_controller.dart';
import 'package:food_delivery/over_view/view/widgets/widgets.dart';
import 'package:food_delivery/review_cart/view_model/review_cart_controller.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:provider/provider.dart';

class ProductOverView extends StatefulWidget {
  final QueryDocumentSnapshot<Object?> lastestData;

  const ProductOverView({Key? key, required this.lastestData})
      : super(key: key);

  @override
  State<ProductOverView> createState() => _ProductOverViewState();
}

class _ProductOverViewState extends State<ProductOverView> {
  late String productImage;
  late String productName;
  late String productId;
  late String productQuantity;
  late String productPrice;

  final idd = FirebaseFirestore.instance.collection('reviewCart').doc();

  @override
  Widget build(BuildContext context) {
    final pov = context.read<ProductRespository>();
    final cartPov = context.read<ReviewCartController>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        leading: IconButton(
          onPressed: () {
            Routes.pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: blackColor,
                  )),
            ],
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 16, 0, 0),
            
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
              child: Text(
                widget.lastestData['productName'],
                style: gFontsSans(fw: FontWeight.bold, sz: 30, cl: whiteColor),
              ),
            ),
          ),
          //   Stack(
          //   children: [
          Column(
            children: [
              SizedBox(
                height: size.width / 10,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height / 2,
                width: size.width / 1.1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.lastestData['productImage']),
                  ),
                ),
              ),
              Text(
                "Available Options",
                style: gFontsSans(fw: FontWeight.w500),
              ),
              height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  SmallMeduimSizeNotifyWidget(
                    title: 'S',
                  ),
                  SmallMeduimSizeNotifyWidget(
                    title: 'M',
                  ),
                  SmallMeduimSizeNotifyWidget(
                    title: 'L',
                  ),
                ],
              ),
              height,
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //
                    Row(
                      children: [
                        Text(
                          " \$ ${widget.lastestData['productoffers'].toString()}",
                          style: gFontsSans(
                              sz: 30, cl: green, fw: FontWeight.bold),
                        ),
                        width,
                        Text(
                          " \$ ${widget.lastestData['productPrice'].toString()}",
                          style: const TextStyle(
                              color: red,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 20),
                        ),
                      ],
                    ),

                    Text(
                      "12 piece Avaliable",
                      style: gFontsSans(
                          sz: 15, cl: const Color.fromARGB(255, 254, 13, 13)),
                    ),
                  ],
                ),
              ),
              height,
              Text(
                " Onam special ${pov.discountAmount(widget.lastestData['productPrice'], widget.lastestData['productoffers'])}% off- ",
                style: const TextStyle(color: green),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RatingBar.builder(
                  initialRating: widget.lastestData['productRating'],
                  itemSize: 25,
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
              ),
              Text(
                "Description",
                style: gFontsSans(cl: greyColor),
              ),
              height,
              const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printe It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
              ),
            ],
          ),
          // ],
          // ),
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          Consumer<ReviewCartController>(
            builder: (context, value, _) => InkWell(
              onTap: () {
                value.addReviewCartData(
                  cartName: widget.lastestData['productName'],
                  cartmage: widget.lastestData['productImage'],
                  cartPrice: widget.lastestData['productPrice'],
                  cartBrandName: widget.lastestData['brandName'],
                );
              },
              child: const CustomBottomNavBar(
                iconColor: whiteColor,
                backgroundColor: blackColor,
                color: whiteColor,
                title: "Add to cart",
                iconData: Icons.favorite,
              ),
            ),
          ),
          const CustomBottomNavBar(
            iconColor: whiteColor,
            backgroundColor: Color.fromARGB(255, 161, 0, 54),
            color: whiteColor,
            title: "Buy Now",
            iconData: Icons.shopping_bag,
          ),
        ],
      ),
    );
  }
}
