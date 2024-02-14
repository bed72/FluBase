class FailureModel {
  final int code;
  final String message;
  final Map<String, dynamic> data;

  FailureModel({
    required this.code,
    required this.data,
    required this.message,
  });
}
