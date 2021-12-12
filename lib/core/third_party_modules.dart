import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @Named("BaseUrl")
  String get baseUrl => dotenv.env['BASE_URL']!;

  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));

  @lazySingleton
  DataConnectionChecker dataConnection() => DataConnectionChecker();
}
