import 'package:dartz/dartz.dart';
import 'package:mohammad_akbari_crud_test/core/error/Exceptions.dart';
import 'package:mohammad_akbari_crud_test/core/error/Failures.dart';
import 'package:mohammad_akbari_crud_test/core/network/NetworkInfo.dart';
import 'package:mohammad_akbari_crud_test/customer/domain/entities/Customer.dart';
import 'package:mohammad_akbari_crud_test/customer/domain/interface/CustomerInterface.dart';
import 'package:mohammad_akbari_crud_test/customer/infrastructure/datasources/CustomerLocalDataSource.dart';
import 'package:mohammad_akbari_crud_test/customer/infrastructure/datasources/CustomerRemoteDataSource.dart';
import 'package:mohammad_akbari_crud_test/customer/infrastructure/models/CustomerModel.dart';

class CustomerRepository extends CustomerInterface {
  final NetworkInfo networkInfo;
  final CustomerLocalDataSource localDataSource;
  final CustomerRemoteDataSource remoteDataSource;

  CustomerRepository({
    required this.networkInfo,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, String>> delete(int id) async {
    if (!await networkInfo.isConnected) {
      String message = await localDataSource.delete(id);
      return Right(message);
    }
    try {
      String message = await remoteDataSource.delete(id);
      return Right(message);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnAuthorizeException catch (e) {
      return Left(UnAutoriseFailure());
    }
  }

  @override
  Future<Either<Failure, Customer>> getCustomer(int id) async {
    if (!await networkInfo.isConnected) {
      Customer? customer = await localDataSource.getCustomer(id);
      return Right(customer);
    }
    try {
      Customer? customer = await remoteDataSource.getCustomer(id);
      return Right(customer);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnAuthorizeException catch (e) {
      return Left(UnAutoriseFailure());
    }
  }

  @override
  Future<Either<Failure, Customer>> store(Customer customerModel) async {
    if (!await networkInfo.isConnected) {
      CustomerModel cm = CustomerModel(
        firstname: customerModel.firstname,
        lastname: customerModel.lastname,
        dateOfBirth: customerModel.dateOfBirth,
        phoneNumber: customerModel.phoneNumber,
        email: customerModel.email,
        bankAccountNumber: customerModel.bankAccountNumber,
      );
      Customer? customer = await localDataSource.store(cm);
      return Right(customer);
    }
    try {
      Customer? customer = await remoteDataSource.store(customerModel);
      return Right(customer);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnAuthorizeException catch (e) {
      return Left(UnAutoriseFailure());
    }
  }

  @override
  Future<Either<Failure, Customer>> update(Customer customerModel) async {
    if (!await networkInfo.isConnected) {
      CustomerModel cm = CustomerModel(
        firstname: customerModel.firstname,
        lastname: customerModel.lastname,
        dateOfBirth: customerModel.dateOfBirth,
        phoneNumber: customerModel.phoneNumber,
        email: customerModel.email,
        bankAccountNumber: customerModel.bankAccountNumber,
      );
      Customer? customer = await localDataSource.update(cm);
      return Right(customer);
    }
    try {
      Customer? customer = await remoteDataSource.update(customerModel);
      return Right(customer);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnAuthorizeException catch (e) {
      return Left(UnAutoriseFailure());
    }
  }

  @override
  Future<Either<Failure, List<Customer>>> fetchCustomers() async {
    if (!await networkInfo.isConnected) {
      List<CustomerModel> customers = await localDataSource.fetchCustomers();
      return Right(customers);
    }
    try {
      final customers = await remoteDataSource.fetchCustomers();
      return Right(customers);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnAuthorizeException catch (e) {
      return Left(UnAutoriseFailure());
    }
  }
}
