import 'package:test_cat_pragma/domain/entities/cat.dart';

class CatModel {
  Cat fromJson(Map<String, dynamic> json) => Cat(
        id: json["id"] as String,
        name: json["name"] as String,
        intelligence: json["intelligence"] as num,
        origin: json["origin"] as String,
        description: json["description"] as String,
        lifeSpan: json["life_span"] as String,
        adaptability: json["adaptability"] as num,
        image: json["image"] != null
            ? ImageCatModel().fromJson(json["image"] as Map<String, dynamic>)
            : null,
      );
}

class ImageCatModel {
  ImageCat fromJson(Map<String, dynamic> json) => ImageCat(
        url: json["url"] as String?,
      );
}
