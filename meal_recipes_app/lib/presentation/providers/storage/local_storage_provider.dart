import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../infraestructure/datasources/isar_datasource.dart';
import '../../../infraestructure/repositories/local_storage_repository_impl.dart';


final localStorageProvider = Provider((ref){
  return LocalStorageRepositoryImpl(datasource: IsarDatasource());
});