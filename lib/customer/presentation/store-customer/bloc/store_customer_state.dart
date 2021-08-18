part of 'store_customer_bloc.dart';

abstract class StoreCustomerState extends Equatable {
  const StoreCustomerState();
}

class StoreCustomerInitial extends StoreCustomerState {
  @override
  List<Object> get props => [];
}
