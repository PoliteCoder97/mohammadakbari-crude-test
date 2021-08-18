import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  DataConnectionChecker? connectionChecker;

  NetworkInfoImpl() {
    if (connectionChecker == null) connectionChecker = DataConnectionChecker();
  }

  @override
  Future<bool> get isConnected => connectionChecker!.hasConnection;
}
