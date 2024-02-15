import 'package:intl/intl.dart';

import 'package:ohh_ferta/src/domain/constants/constants.dart';

class OfferModel {
  final String id;
  final String name;
  final double price;
  final DateTime validate;
  final String description;
  final String collectionName;
  final List<String> images;
  final List<String> categories;

  OfferModel({
    required this.id,
    required this.name,
    required this.price,
    required this.images,
    required this.validate,
    required this.categories,
    required this.description,
    required this.collectionName,
  });

  String get formatData =>
      'Válido até ${DateFormat('dd MMMM').format(validate)}';

  String get formatImage =>
      '$baseUrl/api/files/$collectionName/$id/${images.first}';

  String get formatThumb =>
      '$baseUrl/api/files/$collectionName/$id/${images.first}?thumb=100x300';
}
