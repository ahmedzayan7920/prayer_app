import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:prayer_app/features/home/domain/usecases/get_location_usecase.dart';
import 'package:prayer_app/features/home/domain/usecases/get_prayer_times_usecase.dart';
import 'package:prayer_app/generated/l10n.dart';

import 'prayer_times_state.dart';
class PrayerTimesCubit extends Cubit<PrayerTimesState> {
  PrayerTimesCubit({
    required this.getPrayerTimesUsecase,
    required this.getLocationUsecase,
  }) : super(PrayerTimesState());

  final GetPrayerTimesUsecase getPrayerTimesUsecase;
  final GetLocationUsecase getLocationUsecase;

  changeCurrentDate(DateTime selectedDate) {
    emit(state.copyWith(currentDate: selectedDate));
  }

  changeMonth(DateTime dateTime) {
    getPrayerTimes(dateTime: dateTime);
  }

  getPrayerTimes({required DateTime dateTime}) async {
    emit(
      state.copyWith(
        status: PrayerTimesRequestStatus.loading,
        currentDate: dateTime,
        prayerTimes: [],
      ),
    );
    print("loading");

    final locationResult = await getLocationUsecase();

    locationResult.fold(
      (failure) {
        print("location failure");
        emit(state.copyWith(
          status: PrayerTimesRequestStatus.failure,
          errorMessage: failure.message,
        ));
      },
      (position) async {
        print("location success");
        // Ensure we have a valid position before proceeding
        if (position != null) {
          var failureOrSuccess = await getPrayerTimesUsecase(
            longitude: position.longitude,
            latitude: position.latitude,
            dateTime: dateTime,
          );
          failureOrSuccess.fold(
            (failure) {
              print("get prayer times failure");
              emit(state.copyWith(
                status: PrayerTimesRequestStatus.failure,
                errorMessage: failure.message,
              ));
            },
            (prayerTimes) {
              print("get prayer times success");
              emit(state.copyWith(
                status: PrayerTimesRequestStatus.success,
                prayerTimes: prayerTimes,
              ));
            },
          );
        } else {
          print("location denied");
          emit(state.copyWith(
            status: PrayerTimesRequestStatus.failure,
            errorMessage: S.current.locationDenied, // Or another relevant message
          ));
        }
      },
    );
  }
}
