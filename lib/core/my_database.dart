import 'dart:async';

import 'package:mohammad_akbari_crud_test/customer/infrastructure/datasources/CustomerLocalDataSource.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {
  int _dbVersion = 1;
  Database? _db;

  Future<Database?> getDb() async {
    if (_db != null) return _db;

    _db = await makeDb();
    return _db;
  }

  Future close() async {
    var db = await getDb();
//    db.close();
  }

  makeDb() async {
    var dbPath = await getDatabasesPath();
    var path = '$dbPath/mydb.db';

    var myDb = await openDatabase(path,
        version: _dbVersion, onCreate: onCreate, onUpgrade: onUpgrade);
    return myDb;
  }

  FutureOr<void> onCreate(Database db, int version) {
    db.execute(
        'CREATE TABLE IF NOT EXISTS ${CustomerLocalDataSource.table} (id INTEGER PRIMARY KEY AUTOINCREMENT, firstname Text, lastname Text, phoneNumber TEXT UNIQUE, email Text UNIQUE, bankAccountNumber Text Unique)');
  }

  FutureOr<void> onUpgrade(Database db, int oldVersion, int newVersion) {}
}
