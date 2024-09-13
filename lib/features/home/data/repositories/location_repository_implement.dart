import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:prayer_app/core/error/failures.dart';

import '../../../../generated/l10n.dart';
import '../../domain/repositories/location_repository.dart';

class LocationRepositoryImplement implements LocationRepository {
  @override
  Future<Either<Failure, Position>> getCurrentPosition() async {
    try {
      print("Checking if location services are enabled...");
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print("Location services are disabled.");
        return left(LocationFailure(S.current.locationServiceDisabled));
      }

      print("Fetching current position with a timeout...");
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        timeLimit: Duration(seconds: 30), // Increase timeout duration
      );
      print("Position fetched: $position");
      return right(position);
    } on TimeoutException catch (e) {
      print("Timeout fetching position: $e");
      
      // Try to fetch last known position as a fallback
      Position? lastKnownPosition = await Geolocator.getLastKnownPosition();
      if (lastKnownPosition != null) {
        print("Using last known position: $lastKnownPosition");
        return right(lastKnownPosition);
      } else {
        print("No last known position available.");
        return left(LocationFailure(S.current.locationTimeout));
      }
    } catch (e) {
      print("Error fetching position: $e");
      return left(LocationFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, bool>> hasPermission() async {
    try {
      print("Checking location permission...");
      LocationPermission permission = await Geolocator.checkPermission();
      print("Initial permission: $permission");

      switch (permission) {
        case LocationPermission.denied:
          print("Permission denied, requesting permission...");
          permission = await Geolocator.requestPermission();
          print("Requested permission result: $permission");
          if (permission == LocationPermission.denied) {
            return left(LocationFailure(S.current.locationDenied));
          }
          break;

        case LocationPermission.deniedForever:
          print("Permission permanently denied.");
          return left(LocationFailure(S.current.locationPermanentlyDenied));

        case LocationPermission.whileInUse:
        case LocationPermission.always:
          print("Permission granted.");
          return right(true);

        case LocationPermission.unableToDetermine:
          print("Unable to determine permission.");
          return left(LocationFailure(S.current.unableToDetermineLocationPermission));
      }

      return right(true);
    } on Exception catch (e) {
      print("Error checking permission: $e");
      return left(LocationFailure.fromException(e));
    }
  }
}
