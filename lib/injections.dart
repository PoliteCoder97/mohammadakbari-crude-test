import 'package:get_it/get_it.dart';
import 'package:mohammad_akbari_crud_test/core/network/NetworkInfo.dart';
import 'package:mohammad_akbari_crud_test/customer/infrastructure/datasources/CustomerLocalDataSource.dart';
import 'package:mohammad_akbari_crud_test/customer/infrastructure/datasources/CustomerRemoteDataSource.dart';
import 'package:mohammad_akbari_crud_test/customer/infrastructure/repositories/CustomerRepository.dart';
import 'package:mohammad_akbari_crud_test/customer/presentation/customer-detail/bloc/customer_detail_bloc.dart';
import 'package:mohammad_akbari_crud_test/customer/presentation/customer-list/bloc/customer_list_bloc.dart';
import 'package:mohammad_akbari_crud_test/customer/presentation/store-customer/bloc/store_customer_bloc.dart';

import 'customer/application/CustomerFacadeService.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  customerDependencies();
}

Future<void> customerDependencies() async {

  serviceLocator.registerLazySingleton(
        () => CustomerFacadeService(serviceLocator()),
  );

  // Presentation Layer - Blocs
  serviceLocator.registerFactory(
    () => CustomerDetailBloc(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => CustomerListBloc(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => StoreCustomerBloc(
      serviceLocator(),
    ),
  );

  // Infrastructure Layer
  // repositories
  serviceLocator.registerLazySingleton(
    () => CustomerRepository(
      networkInfo: serviceLocator(),
      localDataSource: serviceLocator(),
      remoteDataSource: serviceLocator(),
    ),
  );
  //data sources
  serviceLocator.registerLazySingleton(
    () => CustomerLocalDataSourceImpl(),
  );
  serviceLocator.registerLazySingleton(
    () => CustomerRemoteDataSourceImpl(),
  );

  serviceLocator.registerLazySingleton(
    () => NetworkInfoImpl(),
  );

}
