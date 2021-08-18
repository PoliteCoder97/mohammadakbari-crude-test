import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mohammad_akbari_crud_test/core/error/Failures.dart';
import 'package:mohammad_akbari_crud_test/customer/application/CustomerFacadeService.dart';
import 'package:mohammad_akbari_crud_test/customer/domain/entities/Customer.dart';

part 'customer_list_event.dart';

part 'customer_list_state.dart';

class CustomerListBloc extends Bloc<CustomerListEvent, CustomerListState> {
  final CustomerFacadeService _customerFacadeService;

  CustomerListBloc(this._customerFacadeService) : super(CustomerListInitial());


  @override
  Stream<CustomerListState> mapEventToState(
    CustomerListEvent event,
  ) async* {
    yield CustomerListLoading();
    if (event is FetchCustomers) {
      final failureOrFetched = await _customerFacadeService.fetchCustomers();
      yield* failureOrFetched.fold((failure) async* {
        print('failure: $failure');
        if (failure is NetworkFailure) {
          yield CustomerListNetworkError();
        } else if (failure is ServerFailure) {
          yield CustomerListServerError(failure.message);
        } else if (failure is UnAutoriseFailure) {
          yield CustomerListUnAuthorizeError();
        }
      }, (customers) async* {
        print('event customers: $customers');
        yield CustomerListLoaded(customers);
      });
    }
  }

}
