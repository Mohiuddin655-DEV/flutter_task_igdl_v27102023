abstract class ApiException {
  final String? _message;

  const ApiException({
    required String? message,
  }) : _message = message;

  @override
  String toString() {
    return "$_message";
  }
}

class InternetException extends ApiException {
  const InternetException([String? message])
      : super(message: message ?? "No internet");
}

class RequestTimeout extends ApiException {
  const RequestTimeout([String? message])
      : super(message: message ?? "Request timeout!");
}

class ServerException extends ApiException {
  const ServerException([String? message])
      : super(message: message ?? "Internal server error!");
}

class InvalidUrlException extends ApiException {
  const InvalidUrlException([String? message])
      : super(message: message ?? "Invalid url");
}

class FetchDataException extends ApiException {
  const FetchDataException([String? message])
      : super(message: message ?? "Error while communication");
}
