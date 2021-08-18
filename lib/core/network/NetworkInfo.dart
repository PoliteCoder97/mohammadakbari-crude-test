import 'dart:io';

// import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  // DataConnectionChecker? connectionChecker;

  NetworkInfoImpl() {
    // if (connectionChecker == null) connectionChecker = DataConnectionChecker();
  }

  @override
  Future<bool> get isConnected async {
    // return connectionChecker!.hasConnection;

    try {
      final result = await InternetAddress.lookup('google.com');
      // return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      return false;
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
  }
}
