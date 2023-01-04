import 'package:get_it/get_it.dart';
import 'package:prayer_app/core/network/dio_factory.dart';
import 'package:prayer_app/features/home/domain/repositories/prayer_times_repository.dart';
import 'package:prayer_app/features/home/domain/usecases/get_prayer_times_usecase.dart';
import 'package:prayer_app/features/home/presentation/cubit/prayer_times_cubit.dart';
import 'features/home/data/datasources/prayer_times_remote_data_source.dart';
import 'features/home/data/repositories/prayer_times_repository_implement.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // cubits
  sl.registerFactory(() => PrayerTimesCubit(getPrayerTimesUsecase: sl()));

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
