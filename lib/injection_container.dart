import 'package:get_it/get_it.dart';

import 'app/domain/services/get_contacts.dart';
import 'app/presentation/bloc/contact_bloc.dart';

final sl = GetIt.instance;

void init() {
  // bloc
  sl.registerFactory(() => ContactBloc(getContacts: sl()));

  // service
  sl.registerLazySingleton(() => GetContacts(sl()));
}
