part of 'customer_detail_bloc.dart';

abstract class CustomerDetailState extends Equatable {
  const CustomerDetailState();
}

class CustomerDetailInitial extends CustomerDetailState {
  @override
  List<Object> get props => [];
}
