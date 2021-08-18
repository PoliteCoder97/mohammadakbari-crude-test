import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohammad_akbari_crud_test/MyTextFormField.dart';
import 'package:mohammad_akbari_crud_test/customer/domain/entities/Customer.dart';
import 'package:mohammad_akbari_crud_test/customer/presentation/customer-list/bloc/customer_list_bloc.dart';

import 'bloc/store_customer_bloc.dart';

class StoreCustomerPage extends StatelessWidget {
  static final String routeName = '/StoreCustomerPage';

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  StoreCustomerPage();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bankAccountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final storeCustomerBloc = BlocProvider.of<StoreCustomerBloc>(context);
    final customerListBloc = BlocProvider.of<CustomerListBloc>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('New customer'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add new customer',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 22,
                ),
                MyTextFormField(_nameController, 'Name', Icons.person, (value) {
                  if (value == null || value.isEmpty) return 'Enter valid Name';
                }),
                MyTextFormField(_lastnameController, 'Lastname', Icons.person,
                    (value) {
                  if (value == null || value.isEmpty)
                    return 'Enter valid Lastname';
                }),
                MyTextFormField(
                  _dateOfBirthController,
                  'Date or birth',
                  Icons.person,
                  (value) {
                    if (value == null || value.isEmpty)
                      return 'Enter valid date of birth';
                  },
                  textInputType: TextInputType.datetime,
                ),
                MyTextFormField(
                  _phoneNumberController,
                  'Phone number',
                  Icons.person,
                  (value) {
                    if (value == null || value.isEmpty)
                      return 'Enter valid phone number';
                    if (!RegExp(r"^(?:[+0]9)?[0-9]{10}$").hasMatch(value!)) {
                      return 'Enter valid phone number';
                    }
                  },
                  textInputType: TextInputType.phone,
                ),
                MyTextFormField(_emailController, 'Email', Icons.person,
                    (value) {
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!)) {
                    return 'Enter valid email address';
                  }
                }, textInputType: TextInputType.emailAddress),
                MyTextFormField(_bankAccountNumberController,
                    'Bank Account Number', Icons.person, (value) {
                  if (value == null || value.isEmpty)
                    return 'Enter valid bank account number';
                }),
                SizedBox(
                  height: 22,
                ),
                BlocConsumer<StoreCustomerBloc, StoreCustomerState>(
                  listener: (context, state) => Container(),
                  builder: (context, state) {
                    print('StoreCustomerBloc state: $state');
                    if (state is StoreCustomerLoading)
                      return CircularProgressIndicator();
                    if (state is StoreCustomerLoaded) {
                      print(state.customer);
                      if (state.customer != null) {
                        WidgetsBinding.instance!
                            .addPostFrameCallback((timeStamp) {
                          // final customerListBloc = serviceLocator<CustomerListBloc>();
                          customerListBloc.add(FetchCustomers());
                          // Navigator.of(context).pop();
                        });
                      }
                    }
                    if (state is StoreCustomerServerError) {
                      WidgetsBinding.instance!
                          .addPostFrameCallback((timeStamp) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(state.message),
                          ),
                        );
                      });
                    }
                    return InkWell(
                      onTap: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        storeCustomerBloc.add(StoreEvent(Customer(
                          firstname: _nameController.text,
                          lastname: _lastnameController.text,
                          dateOfBirth: _dateOfBirthController.text,
                          phoneNumber: _phoneNumberController.text,
                          email: _emailController.text,
                          bankAccountNumber: _bankAccountNumberController.text,
                        )));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            'Save',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
