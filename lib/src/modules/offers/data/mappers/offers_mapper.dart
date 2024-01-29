import 'package:ohh_ferta/src/modules/core/data/mappers/mapper.dart';

import 'package:ohh_ferta/src/modules/offers/data/models/offers_model.dart';

final class OffersMapper implements ListMapper<List<OfferModel>> {
  @override
  List<OfferModel> call(List<dynamic> jsons) => jsons
      .map(
        (json) => OfferModel(
          id: json['id'],
          name: json['name'],
          price: json['price'],
          description: json['description'],
          collectionName: json['collectionName'],
          images: List<String>.from(json['images']),
          validate: DateTime.parse(json['validate']),
          categories: List<String>.from(json['categories']),
        ),
      )
      .toList();
}
