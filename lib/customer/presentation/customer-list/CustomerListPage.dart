import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohammad_akbari_crud_test/customer/presentation/customer-list/bloc/customer_list_bloc.dart';

import '../../../injections.dart';

class CustomerListPage extends StatelessWidget {
  static final String routeName = '/CustomerListPage';

  CustomerListPage();

  @override
  Widget build(BuildContext context) {
    final customerListBloc = serviceLocator<CustomerListBloc>();
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'PoliteCoder97',
      ),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: BlocProvider<CustomerListBloc>(
        create: (context) => customerListBloc..add(FetchCustomers()),
        child: BlocListener<CustomerListBloc, CustomerListState>(
          listener: (context, state) => Container(),
          child: BlocBuilder<CustomerListBloc, CustomerListState>(
            builder: (context, state) {
              print('list state: $state');

              if (state is CustomerListLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CustomerListLoaded) {
                return state.customers.length == 0
                    ? Center(
                        child: Text('There is no customer yet, add one'),
                      )
                    : ListView.builder(
                        itemCount: state.customers.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
                              margin: const EdgeInsets.all(4),
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(),
                                child: Column(),
                              ));
                        },
                      );
              } else if (state is CustomerListServerError) {
              } else if (state is CustomerListNetworkError) {
              } else if (state is CustomerListUnAuthorizeError) {}
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
