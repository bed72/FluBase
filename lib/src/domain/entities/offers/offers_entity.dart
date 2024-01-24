import 'package:intl/intl.dart';

import 'package:ohh_ferta/src/domain/constants/constants.dart';

class OfferEntity {
  final String id;
  final String name;
  final double price;
  final DateTime validate;
  final String description;
  final String collectionName;
  final List<String> images;
  final List<String> categories;

  OfferEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.validate,
    required this.description,
    required this.collectionName,
    required this.images,
    required this.categories,
  });

  String get formatData {
    final formatter = DateFormat('dd/MM/yy');

    return formatter.format(validate);
  }

  String get formatImage =>
      '$baseURL/api/files/$collectionName/$id/${images.first}';

  String get formatThumb =>
      '$baseURL/api/files/$collectionName/$id/${images.first}?thumb=100x300';
}
