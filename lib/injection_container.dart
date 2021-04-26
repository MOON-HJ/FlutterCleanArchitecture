import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'app/data/datasources/remote_data_source.dart';
import 'app/data/repositories/contacts_repository.dart';
import 'app/domain/repositories.dart/contacts_repository.dart';
import 'app/domain/services/get_contacts.dart';
import 'app/presentation/bloc/contact_bloc.dart';
import 'core/network/network.dart';

final sl = GetIt.instance;

void init() {
  // bloc
  sl.registerFactory(() => ContactBloc(getContacts: sl()));

  // service
  sl.registerLazySingleton(() => GetContacts(sl()));

  // repository
  sl.registerLazySingleton<ContactsRepository>(
      () => ContactsRepositoryImpl(remoteDataSource: sl(), network: sl()));

  // datasources
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(sl()));

  // network
  sl.registerLazySingleton<Network>(() => NetworkImpl(sl()));

  // network checker
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
