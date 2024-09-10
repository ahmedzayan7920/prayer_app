import 'package:get_it/get_it.dart';
import 'package:prayer_app/core/network/dio_factory.dart';
import 'package:prayer_app/features/home/domain/repositories/prayer_times_repository.dart';
import 'package:prayer_app/features/home/domain/usecases/get_prayer_times_usecase.dart';
import 'package:prayer_app/features/home/presentation/cubits/app/app_cubit.dart';
import 'package:prayer_app/features/home/presentation/cubits/prayer_times/prayer_times_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/home/data/datasources/prayer_times_remote_data_source.dart';
import 'features/home/data/repositories/prayer_times_repository_implement.dart';

final sl = GetIt.instance;

Future<void> init() async {

  // services
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // cubits
  sl.registerLazySingleton(() => PrayerTimesCubit(getPrayerTimesUsecase: sl()));
  sl.registerLazySingleton(() => AppCubit(sharedPreferences: sl()));

  // usecases
  sl.registerLazySingleton(() => GetPrayerTimesUsecase(sl()));

  // repository
  sl.registerLazySingleton<PrayerTimesRepository>(() => PrayerTimesRepositoryImplement(
        remoteDataSource: sl(),
      ));

  // datasources
  sl.registerLazySingleton<PrayerTimesRemoteDataSource>(
      () => PrayerTimesRemoteDataSourceImplement(dio: DioFactory.getDio()));

}
