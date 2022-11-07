class DataSourceException implements Exception {
  DataSourceException({this.message = 'Data source error'});

  final String? message;

  @override
  String toString() {
    return message!;
  }
}

class AuthLocalDataSourceException implements Exception {}
