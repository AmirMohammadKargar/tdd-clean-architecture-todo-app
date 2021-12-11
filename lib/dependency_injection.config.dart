// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:data_connection_checker_tv/data_connection_checker.dart' as _i3;
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/network/network_info.dart' as _i4;
import 'core/third_party_modules.dart' as _i11;
import 'features/todos/data/datasources/todo_remote_datasource.dart' as _i6;
import 'features/todos/data/repositories/todo_repository_impl.dart' as _i8;
import 'features/todos/domain/repositories/todo_repository.dart' as _i7;
import 'features/todos/domain/usecases/get_todos.dart' as _i9;
import 'features/todos/presentation/cubit/todo_cubit.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.DataConnectionChecker>(
      () => registerModule.dataConnection());
  gh.factory<_i4.NetworkInfo>(
      () => _i4.NetworkInfoImpl(get<_i3.DataConnectionChecker>()));
  gh.factory<String>(() => registerModule.baseUrl, instanceName: 'BaseUrl');
  gh.lazySingleton<_i5.Dio>(
      () => registerModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i6.TodoRemoteDataSource>(
      () => _i6.TodoRemoteDataSourceImpl(client: get<_i5.Dio>()));
  gh.factory<_i7.TodoRepository>(() => _i8.TodoRepositoryImpl(
      networkInfo: get<_i4.NetworkInfo>(),
      todoRemoteDataSource: get<_i6.TodoRemoteDataSource>()));
  gh.factory<_i9.GetTodos>(() => _i9.GetTodos(get<_i7.TodoRepository>()));
  gh.factory<_i10.TodoCubit>(() => _i10.TodoCubit(get<_i9.GetTodos>()));
  return get;
}

class _$RegisterModule extends _i11.RegisterModule {}
