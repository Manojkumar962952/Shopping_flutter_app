import 'package:flutter/material.dart';
import 'package:shopping_app/CartProvider.dart';
import 'package:shopping_app/dummy_data.dart';
import 'package:provider/provider.dart';

class Cart_item extends StatefulWidget {
  const Cart_item({Key? key}) : super(key: key);

  @override
  State<Cart_item> createState() => _Cart_itemState();
}

class _Cart_itemState extends State<Cart_item> {
  @override
  Widget build(BuildContext context) {
    final cartitems = context.watch<CartProvider>().cart;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Item'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          cartitems.isEmpty
              ? Center(child: Text('Cart is empty'))
              : Expanded(
                  child: ListView.builder(
                    itemCount: cartitems.length,
                    itemBuilder: (context, index) {
                      final cartitem = cartitems[index];
                      return ListTile(
                        title: Text(
                          cartitem['title'].toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            'Size: ${cartitem['sizes'] != null ? cartitem['sizes'].toString() : 'N/A'}'),
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage(cartitem['imageUrl'].toString()),
                          radius: 30,
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog.adaptive(
                                    title: Text(
                                      'Delete',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    content: Text(
                                        'Are you sure want to delete item'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'No',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            Provider.of<CartProvider>(context,
                                                    listen: false)
                                                .removeFromCart(cartitem);
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'Yes',
                                            style: TextStyle(color: Colors.red),
                                          )),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}
