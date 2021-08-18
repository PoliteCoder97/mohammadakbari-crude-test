import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohammad_akbari_crud_test/customer/presentation/customer-detail/CustomerDetailPage.dart';
import 'package:mohammad_akbari_crud_test/customer/presentation/customer-list/bloc/customer_list_bloc.dart';
import 'package:mohammad_akbari_crud_test/customer/presentation/store-customer/StoreCustomerPage.dart';

class CustomerListPage extends StatefulWidget {
  static final String routeName = '/CustomerListPage';

  CustomerListPage();

  @override
  _CustomerListPageState createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  late CustomerListBloc customerListBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    customerListBloc = BlocProvider.of<CustomerListBloc>(context);
    // customerListBloc = serviceLocator<CustomerListBloc>();
  }

  @override
  Widget build(BuildContext context) {
    // final customerListBloc = serviceLocator<CustomerListBloc>();
    customerListBloc.add(FetchCustomers());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PoliteCoder97',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, StoreCustomerPage.routeName);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: BlocListener<CustomerListBloc, CustomerListState>(
        listener: (context, state) {
          print('listener state: $state');
        },
        child: BlocConsumer<CustomerListBloc, CustomerListState>(
          listener: (context, state) => Container(),
          builder: (context, state) {
            print('BlocBuilder state: $state');
            if (state is CustomerListLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CustomerListLoaded) {
              print(state.customers);
              return state.customers.length == 0
                  ? Center(
                      child: Text('There is no customer yet, add one'),
                    )
                  : ListView.builder(
                      itemCount: state.customers.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final customer = state.customers[index];
                        return Card(
                            margin: const EdgeInsets.all(4),
                            child: InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, CustomerDetailPage.routeName,arguments: customer.id);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            '${customer.firstname} ${customer.lastname}',
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      '${customer.email}',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
    );
  }
}
