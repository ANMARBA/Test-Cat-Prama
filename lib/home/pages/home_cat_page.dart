import 'package:flutter/material.dart';
import 'package:test_cat_pragma/blocs/home/home.dart';

import 'package:test_cat_pragma/home/home.dart';

class HomeCatPage extends StatefulWidget {
  const HomeCatPage({Key? key}) : super(key: key);

  @override
  State<HomeCatPage> createState() => _HomeCatPageState();
}

class _HomeCatPageState extends State<HomeCatPage> {
  final _searchCatController = TextEditingController();

  @override
  void dispose() {
    _searchCatController.dispose();
    super.dispose();
  }

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
                  sliver: SliverAppBarHomeCat(
                    searchCatController: _searchCatController,
                  ),
                ),
              ];
            },
            body: BlocBuilder<HomeBloc, HomeState?>(
              builder: (BuildContext homeBloc, HomeState? state) {
                if (state is Loading) {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                } else if (state is GetListCats) {
                  return ListCat(listCats: state.listCats);
                } else if (state is DataEmpty) {
                  return const Center(
                      child: Text('No se encontraron resultados...'));
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
