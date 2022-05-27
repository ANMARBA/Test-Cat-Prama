import 'package:flutter/material.dart';
import 'package:test_cat_pragma/home/home.dart';

class HomeCatPage extends StatefulWidget {
  const HomeCatPage({Key? key}) : super(key: key);

  @override
  State<HomeCatPage> createState() => _HomeCatPageState();
}

class _HomeCatPageState extends State<HomeCatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, _) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: const SliverAppBarHomeCat(),
              ),
            ];
          },
          body: Container(),
        ),
      ),
    );
  }
}
