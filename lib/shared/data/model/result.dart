class Result<T> {
  final T? data;
  final String? error;

  Result._({this.data, this.error});

  bool get isSuccess => data != null && error == null;

  factory Result.success(T data) => Result._(data: data);
  factory Result.failure(String error) => Result._(error: error);
}
