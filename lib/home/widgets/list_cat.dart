import 'package:flutter/material.dart';
import 'package:test_cat_pragma/blocs/home/home.dart';
import 'package:test_cat_pragma/home/home.dart';

class ListCat extends StatelessWidget {
  final List<Cat> listCats;

  const ListCat({
    Key? key,
    required this.listCats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        if (listCats.isNotEmpty) {
          return CustomScrollView(
            key: const PageStorageKey<String>('ScrollListCatsKey'),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverFixedExtentList(
                  itemExtent: 335.0,
                  delegate: SliverChildBuilderDelegate(
                    (_, int index) => CardCat(cat: listCats[index]),
                    childCount: listCats.length,
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Text('Hubo un problema al trae la lista de Gatos')),
          );
        }
      },
    );
  }
}
