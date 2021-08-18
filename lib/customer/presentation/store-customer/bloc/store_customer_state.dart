part of 'store_customer_bloc.dart';

abstract class StoreCustomerState  {
  const StoreCustomerState();
}

class StoreCustomerInitial extends StoreCustomerState {
}


class StoreCustomerLoading extends StoreCustomerState {
}

class StoreCustomerLoaded extends StoreCustomerState {
  final Customer? customer;

  StoreCustomerLoaded(this.customer);
}

class StoreCustomerNetworkError extends StoreCustomerState {
}

class StoreCustomerServerError extends StoreCustomerState {
  final String message;

  StoreCustomerServerError(this.message);

}

class StoreCustomerUnAuthorizeError extends StoreCustomerState {
}