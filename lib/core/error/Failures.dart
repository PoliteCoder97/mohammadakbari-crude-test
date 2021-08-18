import 'package:flutter/material.dart';

abstract class Failure extends ChangeNotifier {
}
//General failures
class ServerFailure extends Failure {
  final dynamic message;
  ServerFailure(this.message);
}

class NetworkFailure extends Failure {}
class UnAutoriseFailure extends Failure {}
