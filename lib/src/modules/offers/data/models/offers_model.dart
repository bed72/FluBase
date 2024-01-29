import 'package:intl/intl.dart';

import 'package:ohh_ferta/src/common/constants/constants.dart';

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
      '$baseUrl/api/files/$collectionName/$id/${images.first}';

  String get formatThumb =>
      '$baseUrl/api/files/$collectionName/$id/${images.first}?thumb=100x300';
}
