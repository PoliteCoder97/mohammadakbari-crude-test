import 'package:dartz/dartz.dart';
import 'package:mohammad_akbari_crud_test/core/error/Failures.dart';
import 'package:mohammad_akbari_crud_test/customer/domain/entities/Customer.dart';
import 'package:mohammad_akbari_crud_test/customer/domain/logic/CustomerLogic.dart';
import 'package:mohammad_akbari_crud_test/customer/infrastructure/repositories/CustomerRepository.dart';

class CustomerFacadeService with CustomerLogic {
  final CustomerRepository? _repository;

  CustomerFacadeService(this._repository);

  Future<Either<Failure, Customer?>> store(Customer customerModel) async {
    return _repository!.store(customerModel);
  }

  Future<Either<Failure, Customer?>> getCustomer(int id) async {
    return _repository!.getCustomer(id);
  }

  Future<Either<Failure, List<Customer>>> fetchCustomers() async {
    return _repository!.fetchCustomers();
  }

  Future<Either<Failure, Customer?>> update(Customer customerModel) async {
    return _repository!.update(customerModel);
  }

  Future<Either<Failure, String>> delete(int id) async {
    return _repository!.delete(id);
  }
}
