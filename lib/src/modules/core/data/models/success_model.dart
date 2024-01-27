import 'package:ohh_ferta/src/modules/core/domain/entities/success_entity.dart';

class SuccessModel {
  final int page;
  final int perPage;
  final int totalItems;
  final int totalPages;
  final List<dynamic> items;

  SuccessModel({
    required this.page,
    required this.items,
    required this.perPage,
    required this.totalItems,
    required this.totalPages,
  });

  SuccessEntity toEntity() => SuccessEntity(
        page: page,
        items: items,
        perPage: perPage,
        totalItems: totalItems,
        totalPages: totalPages,
      );
}
