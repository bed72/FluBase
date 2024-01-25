import 'package:ohh_ferta/src/modules/core/domain/entities/pager/pager_entity.dart';

class PagerModel {
  final int page;
  final int perPage;
  final int totalItems;
  final int totalPages;
  final List<dynamic> items;

  PagerModel({
    required this.page,
    required this.items,
    required this.perPage,
    required this.totalItems,
    required this.totalPages,
  });

  PagerEntity toEntity() => PagerEntity(
        page: page,
        items: items,
        perPage: perPage,
        totalItems: totalItems,
        totalPages: totalPages,
      );
}
