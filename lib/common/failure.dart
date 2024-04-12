abstract class Failure {
  final String? message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}

class ConnectionTimeoutFailure extends Failure {
  ConnectionTimeoutFailure(String? message) : super(message);
}

class ConnectionFailure extends Failure {
  ConnectionFailure(String? message) : super(message);
}

class BadCertificateFailure extends Failure {
  BadCertificateFailure(String? message) : super(message);
}

class BadResponseFailure extends Failure {
  BadResponseFailure(String? message) : super(message);
}

class CancelFailure extends Failure {
  CancelFailure(String? message) : super(message);
}

class DatabaseFailure extends Failure {
  DatabaseFailure(String? message) : super(message);
}

class UnknownFailure extends Failure {
  UnknownFailure(String? message) : super(message);
}