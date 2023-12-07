class Failures {
  String? errorMessage;

  Failures({this.errorMessage});
}

class ServerErrors extends Failures {
  ServerErrors({required super.errorMessage});
}

class NetworkErrors extends Failures {
  NetworkErrors({required super.errorMessage});
}
