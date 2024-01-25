import 'package:ohh_ferta/src/modules/core/data/mappers/mapper.dart';

import 'package:ohh_ferta/src/modules/offers/data/models/offers/offers_model.dart';

final class OfferMapper implements Mapper<List<OfferModel>> {
  @override
  List<OfferModel> call(List<dynamic> jsons) => jsons
      .map(
        (json) => OfferModel(
          id: json['id'],
          name: json['name'],
          price: json['price'],
          validate: json['validate'],
          description: json['description'],
          collectionName: json['collectionName'],
          images: List<String>.from(json['images']),
          categories: List<String>.from(json['categories']),
        ),
      )
      .toList();
}
