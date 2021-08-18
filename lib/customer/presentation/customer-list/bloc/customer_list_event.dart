part of 'customer_list_bloc.dart';

abstract class CustomerListEvent  {
  const CustomerListEvent();

}
  class FetchCustomers extends CustomerListEvent{
}
