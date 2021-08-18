part of 'customer_list_bloc.dart';

abstract class CustomerListState {
  const CustomerListState();
}

class CustomerListInitial extends CustomerListState {
}

class CustomerListLoading extends CustomerListState {
}

class CustomerListLoaded extends CustomerListState {
  final List<Customer> customers;

  CustomerListLoaded(this.customers);
}

class CustomerListNetworkError extends CustomerListState {
}

class CustomerListServerError extends CustomerListState {
  final String message;

  CustomerListServerError(this.message);

}

class CustomerListUnAuthorizeError extends CustomerListState {
}
