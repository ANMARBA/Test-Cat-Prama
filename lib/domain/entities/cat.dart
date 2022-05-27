import 'package:equatable/equatable.dart';

class Cat extends Equatable {
  final String id;
  final String name;
  final num intelligence;
  final String origin;
  final String description;
  final String lifeSpan;
  final num adaptability;
  final ImageCat? image;

  const Cat({
    required this.id,
    required this.name,
    required this.intelligence,
    required this.origin,
    required this.description,
    required this.lifeSpan,
    required this.adaptability,
    required this.image,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        intelligence,
        origin,
        description,
        lifeSpan,
        adaptability,
        image,
      ];
}

class ImageCat extends Equatable {
  final String? url;

  const ImageCat({required this.url});

  @override
  List<Object?> get props => [url];
}
