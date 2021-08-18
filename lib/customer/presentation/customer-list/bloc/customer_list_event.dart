part of 'customer_list_bloc.dart';

abstract class CustomerListEvent extends Equatable {
  const CustomerListEvent();
}

class FetchCustomers extends CustomerListEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
