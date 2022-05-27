import 'package:flutter/material.dart';
import 'package:test_cat_pragma/blocs/home/home.dart';

class SliverAppBarHomeCat extends StatefulWidget {
  final TextEditingController searchCatController;

  const SliverAppBarHomeCat({
    Key? key,
    required this.searchCatController,
  }) : super(key: key);

  @override
  State<SliverAppBarHomeCat> createState() => _SliverAppBarHomeCatState();
}

class _SliverAppBarHomeCatState extends State<SliverAppBarHomeCat> {
  @override
  void initState() {
    super.initState();
    widget.searchCatController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    widget.searchCatController.removeListener(_onSearchChanged);
    super.dispose();
  }

  _onSearchChanged() {
    if (mounted) {
      context
          .read<HomeBloc>()
          .add(HomeSearchCats(search: widget.searchCatController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<HomeBloc>(context),
      child: SliverAppBar(
        backgroundColor: Colors.white,
        flexibleSpace: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Text(
                'Catbreeds',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              color: Colors.white,
              child: TextField(
                controller: widget.searchCatController,
                decoration: const InputDecoration(
                  hintText: 'Busca gatos...',
                  suffixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.all(10.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                onSubmitted: (search) => {},
              ),
            ),
          ],
        ),
        toolbarHeight: 110,
        pinned: true,
        shadowColor: Colors.transparent,
      ),
    );
  }
}
