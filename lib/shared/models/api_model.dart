class ApiResponse<T> {
  ApiResponse({
    this.status,
    this.message,
    this.data,
    this.error
  });

  bool? status;
  String? message;
  T? data;
  T? error;
}
