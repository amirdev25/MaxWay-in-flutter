import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:max_way/data/global/api.dart';

final GetIt di = GetIt.instance;

void setUp() {
  di.registerLazySingleton(
    () => Api(
      Dio(
        BaseOptions(
            baseUrl: "https://maxway.uz/_next/data/ch7KmKvJ5azfPmlISTmjb"),
      ),
    ),
  );
}
