import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:int_news/core/networking/api_service.dart';
import 'package:int_news/core/networking/dio_factory.dart';
import 'package:int_news/features/home/data/repo/home_repo.dart';
import 'package:int_news/features/home/logic/cubit/home_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //Dio & ApiService
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
