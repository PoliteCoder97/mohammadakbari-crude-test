import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mohammad_akbari_crud_test/core/error/Failures.dart';
import 'package:mohammad_akbari_crud_test/customer/application/CustomerFacadeService.dart';
import 'package:mohammad_akbari_crud_test/customer/domain/entities/Customer.dart';

part 'store_customer_event.dart';

part 'store_customer_state.dart';

class StoreCustomerBloc extends Bloc<StoreCustomerEvent, StoreCustomerState> {
  final CustomerFacadeService _customerFacadeService;

  StoreCustomerBloc(
    this._customerFacadeService,
  ) : super(StoreCustomerInitial());

  late Customer _customer;

  @override
  Stream<StoreCustomerState> mapEventToState(
    StoreCustomerEvent event,
  ) async* {
    print('store event: $event');
    yield StoreCustomerLoading();
    if (event is StoreEvent) {
      print('store event');
      final failureOrFetched =
          await _customerFacadeService.store(event.customer);

      yield* failureOrFetched.fold((failure) async* {
        if (failure is NetworkFailure) {
          yield StoreCustomerNetworkError();
        } else if (failure is ServerFailure) {
        print(failure.message);
          yield StoreCustomerServerError(failure.message);
        } else if (failure is UnAutoriseFailure) {
          yield StoreCustomerUnAuthorizeError();
        }
      }, (customer) async* {
        if (customer != null) this.customer = customer;
        yield StoreCustomerLoaded(customer);
      });
    }
  }

  Customer get customer => _customer;

  set customer(Customer value) {
    _customer = value;
  }
}
