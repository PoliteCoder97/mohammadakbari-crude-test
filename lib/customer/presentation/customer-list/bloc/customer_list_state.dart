part of 'customer_list_bloc.dart';

abstract class CustomerListState extends Equatable {
  const CustomerListState();
}

class CustomerListInitial extends CustomerListState {
  @override
  List<Object> get props => [];
}
