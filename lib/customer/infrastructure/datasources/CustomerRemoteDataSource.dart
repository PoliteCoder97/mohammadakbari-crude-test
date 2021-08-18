import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mohammad_akbari_crud_test/core/error/Exceptions.dart';
import 'package:mohammad_akbari_crud_test/customer/api/CustomerConstants.dart';
import 'package:mohammad_akbari_crud_test/customer/domain/entities/Customer.dart';
import 'package:mohammad_akbari_crud_test/customer/infrastructure/models/CustomerModel.dart';

abstract class CustomerRemoteDataSource {
  Future<Customer?> store(Customer customer);

  Future<CustomerModel?> getCustomer(int id);

  Future<List<CustomerModel>> fetchCustomers();

  Future<Customer?> update(Customer customer);

  Future<String> delete(int id);
}

class CustomerRemoteDataSourceImpl extends CustomerRemoteDataSource {
   http.Client client= http.Client();

  CustomerRemoteDataSourceImpl() {
  }

  @override
  Future<String> delete(int id) async {
    try {
      final response = await client
          .delete(Uri.parse(CustomerConstants.deleteCustomer))
          .catchError((e) {
        throw ServerException('Cant celete this item');
      });

      if (response.statusCode != 200) {
        switch (response.statusCode) {
          case 401:
          case 403:
            throw UnAuthorizeException();
          case 422:
          case 500:
            throw ServerException('Cant celete this item');
          default:
            throw ServerException('Cant celete this item');
        }
      }

      return 'Customer deleted successfully';
    } catch (e) {
      throw ServerException('Cant celete this item');
    }
  }

  @override
  Future<CustomerModel?> getCustomer(int id) async {
    try {
      final response = await client
          .get(Uri.parse('${CustomerConstants.getCustomer} /$id'))
          .catchError((e) {
        throw ServerException('Cant celete this item');
      });

      if (response.statusCode != 200) {
        switch (response.statusCode) {
          case 401:
          case 403:
            throw UnAuthorizeException();
          case 422:
          case 500:
            throw ServerException('Cant celete this item');
          default:
            throw ServerException('Cant celete this item');
        }
      }

      final data = json.decode(response.body);
      if (data['data'] == null) return null;

      return CustomerModel.fromJson(data['data']);
    } catch (e) {
      throw ServerException('Cant celete this item');
    }
  }

  @override
  Future<Customer?> store(Customer customer) async {
    try {
      final response = await client
          .post(Uri.parse(CustomerConstants.store),
              body: json.encode({
                'firstname': customer.firstname,
                'lastname': customer.lastname,
                'dateOfBirth': customer.dateOfBirth,
                'phoneNumber': customer.phoneNumber,
                'email': customer.email,
                'bankAccountNumber': customer.bankAccountNumber,
              }),
              headers: CustomerConstants.getHeders())
          .catchError((e) {
        throw ServerException('Cant celete this item');
      });

      if (response.statusCode != 200) {
        switch (response.statusCode) {
          case 401:
          case 403:
            throw UnAuthorizeException();
          case 422:
          case 500:
            throw ServerException('Cant celete this item');
          default:
            throw ServerException('Cant celete this item');
        }
      }

      final data = json.decode(response.body);
      if (data['data'] == null) return null;

      return CustomerModel.fromJson(data['data']);
    } catch (e) {
      throw ServerException('Cant celete this item');
    }
  }

  @override
  Future<Customer?> update(Customer customer) async {
    try {
      final response = await client
          .put(Uri.parse(CustomerConstants.store),
              body: json.encode({
                'id': customer.id,
                'firstname': customer.firstname,
                'lastname': customer.lastname,
                'dateOfBirth': customer.dateOfBirth,
                'phoneNumber': customer.phoneNumber,
                'email': customer.email,
                'bankAccountNumber': customer.bankAccountNumber,
              }),
              headers: CustomerConstants.getHeders())
          .catchError((e) {
        throw ServerException('Cant celete this item');
      });

      if (response.statusCode != 200) {
        switch (response.statusCode) {
          case 401:
          case 403:
            throw UnAuthorizeException();
          case 422:
          case 500:
            throw ServerException('Cant celete this item');
          default:
            throw ServerException('Cant celete this item');
        }
      }

      final data = json.decode(response.body);
      if (data['data'] == null) return null;

      return CustomerModel.fromJson(data['data']);
    } catch (e) {
      throw ServerException('Cant celete this item');
    }
  }

  @override
  Future<List<CustomerModel>> fetchCustomers() async {
    try {
      final response = await client
          .get(Uri.parse(CustomerConstants.getCustomer))
          .catchError((e) {
        throw ServerException('Cant celete this item');
      });

      if (response.statusCode != 200) {
        switch (response.statusCode) {
          case 401:
          case 403:
            throw UnAuthorizeException();
          case 422:
          case 500:
            throw ServerException('Cant celete this item');
          default:
            throw ServerException('Cant celete this item');
        }
      }

      final data = json.decode(response.body);
      if (data['data'] == null) return <CustomerModel>[];
      return CustomerModel.toList(data['data'] ?? []);
    } catch (e) {
      throw ServerException('Cant celete this item');
    }
  }
}
