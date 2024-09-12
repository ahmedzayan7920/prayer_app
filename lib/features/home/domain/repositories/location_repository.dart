import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/error/failures.dart';

abstract class LocationRepository {
  Future <Either<Failure, Position>> getCurrentPosition();

  Future<Either<Failure, bool>> hasPermission();
}