import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/prayer_times.dart';
import '../repositories/prayer_times_repository.dart';

class GetPrayerTimesUsecase{
  final PrayerTimesRepository repository;
  GetPrayerTimesUsecase(this.repository);
  Future<Either<Failure, List<PrayerTimes>>> call({required double longitude, required double latitude}) async {
    return await repository.getPrayerTimes(longitude: longitude, latitude: latitude);
  }
}