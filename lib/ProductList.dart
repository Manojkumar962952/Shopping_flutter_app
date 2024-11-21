import 'package:flutter/material.dart';

class Product_List extends StatelessWidget {
  final String Product_name;
  final double Price;
  final String Images;
  final Color bgcolor;

  const Product_List(
      {super.key,
      required this.Product_name,
      required this.Images,
      required this.Price,
      required this.bgcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 17),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: bgcolor, borderRadius: BorderRadius.circular(17)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Product_name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('\$$Price'),
          Center(
            child: Image.asset(
              Images,
              height: 170,
            ),
          )
        ],
      ),
    );
  }
}
