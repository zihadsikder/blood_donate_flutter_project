class NetworkResponse {
  final int? statusCode;
  final bool isSuccess;
  String? jsonResponse;
  final String? message;

  NetworkResponse(
      {this.statusCode = -1,
        required this.isSuccess,
        this.jsonResponse,
        this.message ,
        });

  NetworkResponse copyWith({
    int? statusCode,
    bool? isSuccess,
    String? jsonResponse,
    String? message,
  }) {
    return NetworkResponse(
      statusCode: statusCode ?? this.statusCode,
      isSuccess: isSuccess ?? this.isSuccess,
      jsonResponse: jsonResponse ?? this.jsonResponse,
      message: message ?? this.message,

    );
  }

}
