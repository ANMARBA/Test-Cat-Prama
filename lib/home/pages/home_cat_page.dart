import 'package:flutter/material.dart';
import 'package:test_cat_pragma/blocs/home/home.dart';

import 'package:test_cat_pragma/home/home.dart';

class HomeCatPage extends StatefulWidget {
  const HomeCatPage({Key? key}) : super(key: key);

  @override
  State<HomeCatPage> createState() => _HomeCatPageState();
}

class _HomeCatPageState extends State<HomeCatPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => HomeBloc()..add(HomeStarted()),
      child: Scaffold(
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
            body: BlocBuilder<HomeBloc, HomeState?>(
              builder: (_, HomeState? state) {
                if (state is Loading) {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                } else if (state is GetListCats) {
                  return Builder(
                    builder: (BuildContext context) {
                      return CustomScrollView(
                        key: const PageStorageKey<String>('ScrollListCatsKey'),
                        slivers: <Widget>[
                          SliverOverlapInjector(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.all(20),
                            sliver: SliverFixedExtentList(
                              itemExtent: 335.0,
                              delegate: SliverChildBuilderDelegate(
                                (_, int index) =>
                                    CardCat(cat: state.listCats[index]),
                                childCount: state.listCats.length,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
