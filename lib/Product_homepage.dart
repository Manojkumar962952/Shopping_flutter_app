import 'package:flutter/material.dart';
import 'package:shopping_app/ProductList.dart';
import 'package:shopping_app/Product_cart.dart';

import 'package:shopping_app/dummy_data.dart';

class Product_homepage extends StatefulWidget {
  const Product_homepage({Key? key}) : super(key: key);

  @override
  State<Product_homepage> createState() => _Product_homepageState();
}

class _Product_homepageState extends State<Product_homepage> {
  List<String> brand = ['All', 'Adidas', 'Nike', 'Bata'];
  late String filterstr;

  @override
  // ignore: must_call_super
  initState() {
    // ignore: avoid_print
    filterstr = brand[0];
  }

  final border = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
      borderSide:
          BorderSide(color: Color(0xff9d9c97), style: BorderStyle.solid));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SafeArea(
                    child: Text(
                  'Shoes\nCollections',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                )),
              ),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xff9d9c97),
                  ),
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              )),
            ],
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: brand.length,
              itemBuilder: (context, index) {
                final item = brand[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        filterstr = item;
                      });
                    },
                    child: Chip(
                      label: Text(item),
                      backgroundColor:
                          item == filterstr ? Colors.yellow : Color(0xffdeedf9),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                              color: Colors.white, style: BorderStyle.solid)),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final pro = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return Product_cart(product: pro);
                      },
                    ));
                  },
                  child: Product_List(
                    Product_name: pro['title'] as String,
                    Images: pro['imageUrl'] as String,
                    Price: pro['price'] as double,
                    bgcolor: index.isEven ? Color(0xffdeedf9) : Colors.white,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
