import 'package:flutter/material.dart';
import 'package:mohammad_akbari_crud_test/customer/presentation/customer-detail/CustomerDetailPage.dart';
import 'package:mohammad_akbari_crud_test/customer/presentation/customer-list/CustomerListPage.dart';
import 'package:mohammad_akbari_crud_test/customer/presentation/store-customer/StoreCustomerPage.dart';

import './injections.dart' as di;

void main() async {
  // initialize dependencies injections
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: CustomerListPage.routeName,
      routes: {
        CustomerListPage.routeName: (context) => CustomerListPage(),
        CustomerDetailPage.routeName: (context) => CustomerDetailPage(),
        StoreCustomerPage.routeName: (context) => StoreCustomerPage(),
      },
    );
  }
}
