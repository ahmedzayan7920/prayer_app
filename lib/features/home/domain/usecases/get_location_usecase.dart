import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:prayer_app/features/home/domain/repositories/location_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../generated/l10n.dart';
class GetLocationUsecase {
  final LocationRepository repository;

  GetLocationUsecase(this.repository);

  Future<Either<Failure, Position>> call() async {
    print("Starting location permission check...");
    
    // Check permission
    final hasPermissionResult = await repository.hasPermission();
    
    print("Permission result: $hasPermissionResult");

    return hasPermissionResult.fold(
      (failure) {
        print("Permission failure: ${failure.message}");
        return left(failure); // If permission failed, return failure
      },
      (hasPermission) async {
        if (hasPermission) {
          print("Permission granted, fetching current position...");

          // If permission granted, try to get the position
          final result = await repository.getCurrentPosition();
          print("Current position result: $result");

          return result.fold(
            (failure) {
              print("Failed to get current position: ${failure.message}");
              return left(failure); // Handle position failure
            },
            (position) {
              print("Position success: $position");
              return right(position); // Return the position
            },
          );
        }

        // If permissions not granted after requesting
        print("Permissions were not granted.");
        return left(LocationFailure(S.current.locationDenied));
      },
    );
  }
}
