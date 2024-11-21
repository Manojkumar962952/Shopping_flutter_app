import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/CartProvider.dart';
import 'package:shopping_app/dummy_data.dart';

class Product_cart extends StatefulWidget {
  final Map<String, Object> product;
  Product_cart({Key? key, required this.product}) : super(key: key);

  @override
  State<Product_cart> createState() => _Product_cartState();
}

class _Product_cartState extends State<Product_cart> {
  late int tap;
  @override
  // ignore: must_call_super
  initState() {
    // ignore: avoid_print
    tap = 0;
  }

  void onTap() {
    if (tap != 0) {
      Provider.of<CartProvider>(context, listen: false).addToCart(
        {
          'id': widget.product['id'],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'imageUrl': widget.product['imageUrl'],
          'company': widget.product['company'],
          'sizes': tap,
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product added successfully!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a size!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Center(
              child: Text(
            widget.product['title'] as String,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child: Image.asset(widget.product['imageUrl'] as String)),
          ),
          Spacer(
            flex: 2,
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Color(0xffdeedf9),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Text(
                  '\$${widget.product['price'] as double}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final s1 = (widget.product['sizes'] as List<int>)[index];
                      return Container(
                        margin: EdgeInsets.only(left: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              tap = s1;
                            });
                          },
                          child: Chip(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            label: Text(
                              '${(widget.product['sizes'] as List<int>)[index]}',
                            ),
                            backgroundColor:
                                tap == s1 ? Colors.amber[600] : Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xfffbfe24),
                      minimumSize: Size(double.infinity, 50)),
                  onPressed: onTap,
                  child: Text('Add to cart'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
