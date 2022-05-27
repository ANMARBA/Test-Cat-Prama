import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:test_cat_pragma/domain/entities/cat.dart';

class ContainerImageCat extends StatelessWidget {
  final ImageCat? imageCat;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;

  const ContainerImageCat({
    Key? key,
    required this.imageCat,
    this.height,
    this.width,
    this.margin,
  }) : super(key: key);

  String _imageCat(ImageCat? imageCat) {
    String image = 'assets/images/not_found_image.jpg';
    if (imageCat != null) {
      if (imageCat.url != null && imageCat.url!.isNotEmpty) {
        image = imageCat.url as String;
      }
    }
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: margin,
      height: height,
      width: width,
      child: FittedBox(
        fit: BoxFit.fill,
        child: _imageCat(imageCat).contains('not_found_image.jpg')
            ? Image.asset(
                'assets/images/not_found_image.jpg',
                fit: BoxFit.contain,
              )
            : FadeInImage.memoryNetwork(
                image: _imageCat(imageCat),
                placeholder: kTransparentImage,
                fit: BoxFit.fill,
              ),
      ),
    );
  }
}
