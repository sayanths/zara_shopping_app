import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'package:food_delivery/home_screen/view_model/product_controller.dart';
import 'package:food_delivery/over_view/view/widgets/widgets.dart';
import 'package:food_delivery/payments/view/payments.dart';
import 'package:food_delivery/review_cart/view_model/review_cart_controller.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:provider/provider.dart';

class ProductOverView extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> data;

   ProductOverView({Key? key, required this.data})
      : super(key: key);

//   @override
//   State<ProductOverView> createState() => _ProductOverViewState();
// }

// class _ProductOverViewState extends State<ProductOverView> {
  // late String productImage;
  // late String productName;
  // late String productId;
  // late String productQuantity;
  // late String productPrice;

 // final idd = FirebaseFirestore.instance.collection('reviewCart').doc();

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
                data['productName'],
                style: gFontsSans(fw: FontWeight.bold, sz: 30, cl: whiteColor),
              ),
            ),
          ),
        
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
                    image: NetworkImage(data['productImage']),
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
                          " \$ ${data['productoffers'].toString()}",
                          style: gFontsSans(
                              sz: 30, cl: green, fw: FontWeight.bold),
                        ),
                        width,
                        Text(
                          " \$ ${data['productPrice'].toString()}",
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
                " Onam special ${pov.discountAmount(data['productPrice'], data['productoffers'])}% off- ",
                style: const TextStyle(color: green),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RatingBar.builder(
                      initialRating: data['productRating'],
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
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text(
                        "1",
                        textAlign: TextAlign.center,
                        style: gFont(cl: whiteColor),
                      ))),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
                ],
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
            builder: (context, value, _) => Expanded(
              child: InkWell(
                onTap: () {
                  value.addReviewCartData(
                    cartName: data['productName'],
                    cartmage: data['productImage'],
                    cartPrice: data['productPrice'],
                    cartBrandName: data['brandName'],
                  );
                 value.snackbarFunction(context);
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
          ),
          Expanded(
            child: InkWell(
              onTap: () => Routes.push(screen: const PaymentMethod()),
              child: const CustomBottomNavBar(
                iconColor: whiteColor,
                backgroundColor: Color.fromARGB(255, 161, 0, 54),
                color: whiteColor,
                title: "Buy Now",
                iconData: Icons.shopping_bag,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
