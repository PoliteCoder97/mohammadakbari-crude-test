part of 'store_customer_bloc.dart';

abstract class StoreCustomerEvent extends Equatable {
  const StoreCustomerEvent();
}

class StoreEvent extends StoreCustomerEvent {
  final Customer customer;

  StoreEvent(this.customer);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
