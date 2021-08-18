import 'package:dartz/dartz.dart';
import 'package:mohammad_akbari_crud_test/core/error/Failures.dart';

abstract class UseCase<Type,Params>{
  Future<Either<Failure,Type>> call(Params params);
}

class NoParams{
  NoParams();
}