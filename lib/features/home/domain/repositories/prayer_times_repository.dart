import 'package:dartz/dartz.dart';
import '../entities/prayer_times.dart';

import '../../../../core/error/failures.dart';

abstract class PrayerTimesRepository{
  Future<Either<Failure, List<PrayerTimes>>> getPrayerTimes({required double longitude, required double latitude});
}