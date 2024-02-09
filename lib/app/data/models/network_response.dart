class NetworkResponse {
  final int? statusCode;
  final bool isSuccess;
  String? jsonResponse;
  final String successMessage;
  final String errorMessage;

  NetworkResponse(
      {this.statusCode = -1,
        required this.isSuccess,
        this.jsonResponse,
        this.successMessage = "Success",
        this.errorMessage = "something went wrong!"});

  NetworkResponse copyWith({
    int? statusCode,
    bool? isSuccess,
    String? jsonResponse,
    String? successMessage,
    String? errorMessage,
  }) {
    return NetworkResponse(
      statusCode: statusCode ?? this.statusCode,
      isSuccess: isSuccess ?? this.isSuccess,
      jsonResponse: jsonResponse ?? this.jsonResponse,
      successMessage: successMessage ?? this.successMessage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

}
