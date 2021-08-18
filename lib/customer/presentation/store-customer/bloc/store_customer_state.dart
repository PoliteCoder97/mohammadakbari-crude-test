part of 'store_customer_bloc.dart';

abstract class StoreCustomerState extends Equatable {
  const StoreCustomerState();
}

class StoreCustomerInitial extends StoreCustomerState {
  @override
  List<Object> get props => [];
}


class StoreCustomerLoading extends StoreCustomerState {
  @override
  List<Object> get props => [];
}

class StoreCustomerLoaded extends StoreCustomerState {
  final Customer? customer;

  StoreCustomerLoaded(this.customer);
  @override
  List<Object> get props => [];
}

class StoreCustomerNetworkError extends StoreCustomerState {
  @override
  List<Object> get props => [];
}

class StoreCustomerServerError extends StoreCustomerState {
  final String message;

  StoreCustomerServerError(this.message);

  @override
  List<Object> get props => [];
}

class StoreCustomerUnAuthorizeError extends StoreCustomerState {
  @override
  List<Object> get props => [];
}