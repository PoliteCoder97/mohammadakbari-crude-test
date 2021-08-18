import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mohammad_akbari_crud_test/customer/application/CustomerFacadeService.dart';

part 'store_customer_event.dart';
part 'store_customer_state.dart';

class StoreCustomerBloc extends Bloc<StoreCustomerEvent, StoreCustomerState> {
  final CustomerFacadeService _customerFacadeService;
  StoreCustomerBloc(this._customerFacadeService) : super(StoreCustomerInitial());

  @override
  Stream<StoreCustomerState> mapEventToState(
    StoreCustomerEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
