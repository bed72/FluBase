import 'package:ohh_ferta/src/modules/offers/domain/entities/offers_entity.dart';

class OfferModel {
  final String id;
  final String name;
  final double price;
  final String validate;
  final String description;
  final String collectionName;
  final List<String> images;
  final List<String> categories;

  OfferModel({
    required this.id,
    required this.name,
    required this.price,
    required this.validate,
    required this.description,
    required this.collectionName,
    required this.images,
    required this.categories,
  });

  OfferEntity toEntity() => OfferEntity(
        id: id,
        name: name,
        price: price,
        validate: DateTime.parse(validate),
        description: description,
        collectionName: collectionName,
        images: images,
        categories: categories,
      );
}
