import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/customer_detail_bloc.dart';

class CustomerDetailPage extends StatefulWidget {
  static final String routeName = '/CustomerDetailPage';

  const CustomerDetailPage({Key? key}) : super(key: key);

  @override
  _CustomerDetailPageState createState() => _CustomerDetailPageState();
}

class _CustomerDetailPageState extends State<CustomerDetailPage> {
  late CustomerDetailBloc customerDetailBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    customerDetailBloc = BlocProvider.of<CustomerDetailBloc>(context);

    final id = ModalRoute.of(context)!.settings.arguments as int;
    customerDetailBloc.add(GetCustomer(id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Customer Detail',
        ),
      ),
      body: BlocConsumer<CustomerDetailBloc, CustomerDetailState>(
        listener: (context, state) => Container(),
        builder: (context, state) {
          if (state is CustomerDetailLoading)
            return CircularProgressIndicator();
          if (state is CustomerDetailLoaded)
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${state.customer!.firstname ?? ''} ${state.customer!.lastname}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Email: \n${state.customer!.email ?? ''}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Phone number: \n${state.customer!.phoneNumber ?? ''}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Date Of Birth: \n${state.customer!.dateOfBirth ?? ''}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Bank account number: \n${state.customer!.bankAccountNumber ?? ''}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              )),
            );

          return Container();
        },
      ),
    );
  }
}
