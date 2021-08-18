part of 'customer_detail_bloc.dart';

abstract class CustomerDetailEvent extends Equatable {
  const CustomerDetailEvent();
}

class GetCustomer extends CustomerDetailEvent {
  final int id;

  GetCustomer(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
