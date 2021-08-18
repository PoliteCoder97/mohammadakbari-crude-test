import 'package:dartz/dartz.dart';
import 'package:mohammad_akbari_crud_test/core/error/Failures.dart';
import 'package:mohammad_akbari_crud_test/customer/domain/entities/Customer.dart';

abstract class CustomerInterface {
  Future<Either<Failure, Customer?>> store(Customer customerModel);

  Future<Either<Failure, Customer?>> getCustomer(int id);

  Future<Either<Failure, List<Customer>>> fetchCustomers();

  Future<Either<Failure, Customer?>> update(Customer customerMode);

  Future<Either<Failure, String>> delete(int id);
}
