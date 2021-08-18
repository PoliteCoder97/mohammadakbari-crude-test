import 'package:mohammad_akbari_crud_test/core/my_database.dart';
import 'package:mohammad_akbari_crud_test/customer/domain/entities/Customer.dart';
import 'package:mohammad_akbari_crud_test/customer/infrastructure/models/CustomerModel.dart';

abstract class CustomerLocalDataSource extends MyDatabase {
  static final String table = 'customers';

  Future<Customer?> store(CustomerModel customer);

  Future<Customer?> getCustomer(int id);

  Future<List<CustomerModel>> fetchCustomers();

  Future<Customer?> update(CustomerModel customer);

  Future<String> delete(int id);
}

class CustomerLocalDataSourceImpl extends CustomerLocalDataSource {
  static CustomerLocalDataSourceImpl? _instance;

  static CustomerLocalDataSourceImpl? getInstance() {
    if (_instance == null) {
      _instance = CustomerLocalDataSourceImpl();
    }
    return _instance;
  }

  UserDatabase() {}

  @override
  Future<String> delete(int id) async {
    try {
      final db = await getDb();
      await db!.delete(CustomerLocalDataSource.table,
          where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      return 'Delete customer faild';
    }
    return 'Customer deleted successfully';
  }

  @override
  Future<Customer?> getCustomer(int? id) async {
    try {
      final db = await getDb();
      List<Map<String, dynamic>> maps =
          await db!.query(CustomerLocalDataSource.table,
              columns: [
                'id',
                'firstname',
                'lastname',
                'dateOfBirth',
                'phoneNumber',
                'email',
                'bankAccountNumber',
              ],
              where: 'id = ?',
              whereArgs: [id]);
      if (maps.length > 0) {
        return CustomerModel.fromJson(maps.first);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Customer?> store(CustomerModel customer) async {
    try {
      final db = await getDb();
      final params = customer.toMap();
      params.remove('id');

      int recordId = await db!.insert(CustomerLocalDataSource.table, params);
      customer.id = recordId;
      return customer;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Customer?> update(CustomerModel customer) async {
    try {
      Customer? storedCustomer = await this.getCustomer(customer.id);
      if (storedCustomer == null) return null;
      final db = await getDb();
      int recordId = await db!.update(
          CustomerLocalDataSource.table, customer.toMap(),
          where: 'id = ?', whereArgs: [customer.id]);
      return customer;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<CustomerModel>> fetchCustomers() async {
    try {
      List<CustomerModel> list = [];
      var db = await getDb();
      try {
        List<Map<String, dynamic>> maps = await db!
            .rawQuery('SELECT * FROM ${CustomerLocalDataSource.table}');
        for (Map<String, dynamic> map in maps) {
          CustomerModel completedForms = CustomerModel.fromJson(map);
          list.add(completedForms);
        }
      } catch (e) {
        print('catch the error $e');
      }
      return list;
    } catch (e) {
      return [];
    }
  }
}
