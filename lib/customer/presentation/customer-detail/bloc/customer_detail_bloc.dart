import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mohammad_akbari_crud_test/core/error/Failures.dart';
import 'package:mohammad_akbari_crud_test/customer/application/CustomerFacadeService.dart';
import 'package:mohammad_akbari_crud_test/customer/domain/entities/Customer.dart';

part 'customer_detail_event.dart';

part 'customer_detail_state.dart';

class CustomerDetailBloc
    extends Bloc<CustomerDetailEvent, CustomerDetailState> {
  final CustomerFacadeService _customerFacadeService;

  CustomerDetailBloc(this._customerFacadeService)
      : super(CustomerDetailInitial());

  @override
  Stream<CustomerDetailState> mapEventToState(
    CustomerDetailEvent event,
  ) async* {
    yield CustomerDetailLoading();
    if (event is GetCustomer) {
      final failureOrFetched =
          await _customerFacadeService.getCustomer(event.id);

      yield* failureOrFetched.fold((failure) async* {
        if (failure is NetworkFailure) {
          yield CustomerDetailNetworkError();
        } else if (failure is ServerFailure) {
          yield CustomerDetailServerError(failure.message);
        } else if (failure is UnAutoriseFailure) {
          yield CustomerDetailUnAuthorizeError();
        }
      }, (customer) async* {
        yield CustomerDetailLoaded(customer);
      });
    }
  }
}
