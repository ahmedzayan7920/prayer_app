import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:prayer_app/features/home/domain/entities/prayer_times.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/prayer_times_repository.dart';
import '../datasources/prayer_times_remote_data_source.dart';

class PrayerTimesRepositoryImplement implements PrayerTimesRepository {
  final PrayerTimesRemoteDataSource remoteDataSource;

  PrayerTimesRepositoryImplement({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<PrayerTimes>>> getPrayerTimes({
    required double longitude,
    required double latitude,
    required DateTime dateTime,
  }) async {
    try {
      final prayerTimes = await remoteDataSource.getPrayerTimes(
        longitude: longitude,
        latitude: latitude,
        dateTime: dateTime,
      );
      return Right(prayerTimes);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioError(e),
        );
      }
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
