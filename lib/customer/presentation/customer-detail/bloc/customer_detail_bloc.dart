import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mohammad_akbari_crud_test/customer/application/CustomerFacadeService.dart';

part 'customer_detail_event.dart';
part 'customer_detail_state.dart';

class CustomerDetailBloc extends Bloc<CustomerDetailEvent, CustomerDetailState> {
  final CustomerFacadeService _customerFacadeService;
  CustomerDetailBloc(this._customerFacadeService) : super(CustomerDetailInitial());

  @override
  Stream<CustomerDetailState> mapEventToState(
    CustomerDetailEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
