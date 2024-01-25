class PagerEntity<T> {
  final int page;
  final int perPage;
  final List<T> items;
  final int totalItems;
  final int totalPages;

  PagerEntity({
    required this.page,
    required this.items,
    required this.perPage,
    required this.totalItems,
    required this.totalPages,
  });
}
