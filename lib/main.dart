import 'package:flutter/material.dart';
import 'package:test_cat_pragma/commons/widgets/custom_scroll_behavior.dart';

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
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: child!,
        );
      },
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.black),
      ),
      home: const HomeCatPage(),
    );
  }
}
