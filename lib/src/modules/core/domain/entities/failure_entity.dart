class FailureEntity {
  final int code;
  final String message;
  final Map<String, dynamic> data;

  FailureEntity({
    required this.code,
    required this.message,
    required this.data,
  });
}
