import 'package:ohh_ferta/src/data/models/model.dart';

import 'package:ohh_ferta/src/domain/entities/pager/pager_entity.dart';

class PagerModel<T> extends Model<PagerEntity<T>> {
  final int page;
  final int perPage;
  final List<T> items;
  final int totalItems;
  final int totalPages;

  PagerModel({
    required this.page,
    required this.items,
    required this.perPage,
    required this.totalItems,
    required this.totalPages,
  });

  @override
  PagerEntity<T> toEntity() => PagerEntity(
        page: page,
        items: items,
        perPage: perPage,
        totalItems: totalItems,
        totalPages: totalPages,
      );
}
