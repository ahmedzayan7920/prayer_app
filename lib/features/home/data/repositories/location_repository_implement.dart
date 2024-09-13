import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/error/failures.dart';
import '../../../../generated/l10n.dart';
import '../../domain/repositories/location_repository.dart';

class LocationRepositoryImplement implements LocationRepository {
  @override
  Future<Either<Failure, Position>> getCurrentPosition() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return left(LocationFailure(S.current.locationServiceDisabled));
      }

      final position = await Geolocator.getCurrentPosition();
      return right(position);
    } on TimeoutException catch (_) {
      // Try to fetch last known position as a fallback
      Position? lastKnownPosition = await Geolocator.getLastKnownPosition();
      if (lastKnownPosition != null) {
        return right(lastKnownPosition);
      } else {
        return left(LocationFailure(S.current.locationTimeout));
      }
    } catch (e) {
      return left(LocationFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> hasPermission() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();

      switch (permission) {
        case LocationPermission.denied:
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            return left(LocationFailure(S.current.locationDenied));
          }
          break;

        case LocationPermission.deniedForever:
          return left(LocationFailure(S.current.locationPermanentlyDenied));

        case LocationPermission.whileInUse:
        case LocationPermission.always:
          return right(true);

        case LocationPermission.unableToDetermine:
          return left(
              LocationFailure(S.current.unableToDetermineLocationPermission));
      }

      return right(true);
    } on Exception catch (e) {
      return left(LocationFailure.fromException(e));
    }
  }
}
