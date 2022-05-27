import 'package:flutter/material.dart';

class SliverAppBarHomeCat extends StatelessWidget {
  const SliverAppBarHomeCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
            margin:
                const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 10),
            color: Colors.white,
            child: TextField(
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
      toolbarHeight: 150,
      pinned: true,
      shadowColor: Colors.transparent,
    );
  }
}
