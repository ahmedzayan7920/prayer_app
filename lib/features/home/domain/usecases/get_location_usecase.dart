import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import '../repositories/location_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../generated/l10n.dart';

class GetLocationUsecase {
  final LocationRepository repository;

  GetLocationUsecase(this.repository);

  Future<Either<Failure, Position>> call() async {
    // Check permission
    final hasPermissionResult = await repository.hasPermission();

    return hasPermissionResult.fold(
      (failure) {
        return left(failure); // If permission failed, return failure
      },
      (hasPermission) async {
        if (hasPermission) {
          // If permission granted, try to get the position
          final result = await repository.getCurrentPosition();

          return result.fold(
            (failure) {
              return left(failure); // Handle position failure
            },
            (position) {
              return right(position); // Return the position
            },
          );
        }

        // If permissions not granted after requesting
        return left(LocationFailure(S.current.locationDenied));
      },
    );
  }
}
