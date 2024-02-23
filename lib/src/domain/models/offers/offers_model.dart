import 'package:intl/intl.dart';

import 'package:ohh_ferta/src/domain/constants/constants.dart';

class OfferModel {
  final String id;
  final String name;
  final double price;
  final String thumbnail;
  final DateTime validate;
  final String description;
  final List<String> images;
  final List<String> categories;

  OfferModel({
    required this.id,
    required this.name,
    required this.price,
    required this.images,
    required this.validate,
    required this.thumbnail,
    required this.categories,
    required this.description,
  });

  String get getDate => 'Válido até ${DateFormat('dd MMMM').format(validate)}';

  String get getThumbnail =>
      '$baseUrl/api/files/$thumbnail/$id/${images.first}';

  String get getImage =>
      '$baseUrl/api/files/$thumbnail/$id/${images.first}?thumb=100x300';
}
