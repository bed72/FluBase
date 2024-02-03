enum Screens {
  root(path: '/'),
  offers(path: '/offers/'),
  stores(path: '/stores/'),
  explore(path: '/explore/');

  final String path;

  const Screens({required this.path});
}
