import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mohammad_akbari_crud_test/customer/application/CustomerFacadeService.dart';

part 'customer_list_event.dart';
part 'customer_list_state.dart';

class CustomerListBloc extends Bloc<CustomerListEvent, CustomerListState> {
  final CustomerFacadeService _customerFacadeService;
  CustomerListBloc(this._customerFacadeService) : super(CustomerListInitial());

  @override
  Stream<CustomerListState> mapEventToState(
    CustomerListEvent event,
  ) async* {
  }
}
