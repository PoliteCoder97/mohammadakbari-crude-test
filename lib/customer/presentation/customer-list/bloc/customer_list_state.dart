part of 'customer_list_bloc.dart';

abstract class CustomerListState extends Equatable {
  const CustomerListState();
}

class CustomerListInitial extends CustomerListState {
  @override
  List<Object> get props => [];
}

class CustomerListLoading extends CustomerListState {
  @override
  List<Object> get props => [];
}

class CustomerListLoaded extends CustomerListState {
  final List<Customer> customers;

  CustomerListLoaded(this.customers);

  @override
  List<Object> get props => [this.customers];
}

class CustomerListNetworkError extends CustomerListState {
  @override
  List<Object> get props => [];
}

class CustomerListServerError extends CustomerListState {
  final String message;

  CustomerListServerError(this.message);

  @override
  List<Object> get props => [];
}

class CustomerListUnAuthorizeError extends CustomerListState {
  @override
  List<Object> get props => [];
}
