import 'package:flutter/material.dart';

import 'home/pages/home_cat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.black),
      ),
      home: const HomeCatPage(),
    );
  }
}
