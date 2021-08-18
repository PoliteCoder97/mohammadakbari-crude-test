import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohammad_akbari_crud_test/customer/presentation/customer-detail/CustomerDetailPage.dart';
import 'package:mohammad_akbari_crud_test/customer/presentation/customer-list/CustomerListPage.dart';
import 'package:mohammad_akbari_crud_test/customer/presentation/store-customer/StoreCustomerPage.dart';

import './injections.dart' as di;
import 'customer/presentation/customer-detail/bloc/customer_detail_bloc.dart';
import 'customer/presentation/customer-list/bloc/customer_list_bloc.dart';
import 'customer/presentation/store-customer/bloc/store_customer_bloc.dart';

void main() async {
  // initialize dependencies injections
  await di.init();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<CustomerListBloc>(
      create: (context) => di.serviceLocator<CustomerListBloc>(),
    ),
    BlocProvider<StoreCustomerBloc>(
      create: (context) => di.serviceLocator<StoreCustomerBloc>(),
    ),
    BlocProvider<CustomerDetailBloc>(
      create: (context) => di.serviceLocator<CustomerDetailBloc>(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
