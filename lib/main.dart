import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/CartProvider.dart';

import 'package:shopping_app/dummy_data.dart';
import 'package:shopping_app/Home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        home: Home_page(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xfffbfe24),
            onPrimary: Color(0xfffbfe24),
          ),
        ),
      ),
    );
  }
}
