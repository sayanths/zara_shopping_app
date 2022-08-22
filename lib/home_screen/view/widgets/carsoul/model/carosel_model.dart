import 'package:cloud_firestore/cloud_firestore.dart';

class CarosoulModel {
  late String image;

  CarosoulModel({required this.image});

  factory CarosoulModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snap) {
    return CarosoulModel(
      image: snap['carsoul_image'],
    );
  }
}
