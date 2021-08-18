import 'package:dartz/dartz.dart';
import 'package:mohammad_akbari_crud_test/core/error/Failures.dart';
import 'package:mohammad_akbari_crud_test/customer/application/CustomerFacadeService.dart';
import 'package:mohammad_akbari_crud_test/customer/domain/entities/Customer.dart';

import '../../injections.dart';

class CustomerApi {
  final CustomerFacadeService customerFacadeService =
      serviceLocator<CustomerFacadeService>();

  Future<Either<Failure, Customer>> store(Customer customerModel) {
    return customerFacadeService.store(customerModel);
  }

  Future<Either<Failure, Customer>> getCustomer(int id) {
    return customerFacadeService.getCustomer(id);
  }
  Future<Either<Failure, List<Customer>>> fetshCustomers(int id) {
    return customerFacadeService.fetchCustomers();
  }

  Future<Either<Failure, Customer>> update(Customer customerModel) {
    return customerFacadeService.update(customerModel);
  }

  Future<Either<Failure, String>> delete(int id) {
    return customerFacadeService.delete(id);
  }
}
