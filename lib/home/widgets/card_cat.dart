import 'package:flutter/material.dart';
import 'package:test_cat_pragma/home/pages/detail_cat_page.dart';
import 'package:test_cat_pragma/home/widgets/container_image_cat.dart';

import 'package:test_cat_pragma/domain/entities/cat.dart';

class CardCat extends StatelessWidget {
  final Cat cat;

  const CardCat({
    Key? key,
    required this.cat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _textCatStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 15);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailCatPage(cat: cat)),
        );
      },
      child: Card(
        elevation: 0,
        shape: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(cat.name, style: _textCatStyle),
                  const Text('Más...', style: _textCatStyle),
                ],
              ),
              ContainerImageCat(
                imageCat: cat.image,
                width: 250,
                height: 250,
                margin: const EdgeInsets.all(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(cat.origin, style: _textCatStyle),
                  Text('${cat.intelligence}', style: _textCatStyle),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
