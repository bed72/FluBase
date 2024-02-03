abstract interface class JsonMapper<T> {
  T call(Map<String, dynamic> json);
}

abstract interface class ListMapper<T> {
  T call(List<dynamic> jsons);
}
