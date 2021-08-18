part of 'customer_detail_bloc.dart';

abstract class CustomerDetailState extends Equatable {
  const CustomerDetailState();
}

class CustomerDetailInitial extends CustomerDetailState {
  @override
  List<Object> get props => [];
}

class CustomerDetailLoading extends CustomerDetailState {
  @override
  List<Object> get props => [];
}

class CustomerDetailLoaded extends CustomerDetailState {
  final Customer? customer;

  CustomerDetailLoaded(this.customer);

  @override
  List<Object> get props => [];
}

class CustomerDetailNetworkError extends CustomerDetailState {
  @override
  List<Object> get props => [];
}

class CustomerDetailServerError extends CustomerDetailState {
  final String message;

  CustomerDetailServerError(this.message);

  @override
  List<Object> get props => [];
}

class CustomerDetailUnAuthorizeError extends CustomerDetailState {
  @override
  List<Object> get props => [];
}
