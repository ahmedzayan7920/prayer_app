import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:prayer_app/core/utils/app_strings.dart';
import 'package:prayer_app/features/home/domain/usecases/get_prayer_times_usecase.dart';

import 'prayer_times_state.dart';

class PrayerTimesCubit extends Cubit<PrayerTimesState> {
  PrayerTimesCubit({required this.getPrayerTimesUsecase})
      : super(PrayerTimesState());
  final GetPrayerTimesUsecase getPrayerTimesUsecase;

  changeCurrentDate(DateTime selectedDate) {
    emit(state.copyWith(currentDate: selectedDate));
  }

  changeMonth(DateTime dateTime) {
    getPrayerTimes(dateTime: dateTime);
  }

  Position? _position;

  getPrayerTimes({required DateTime dateTime}) async {
    emit(
      state.copyWith(
        status: PrayerTimesRequestStatus.loading,
        currentDate: dateTime,
        prayerTimes: [],
      ),
    );
    await _getCurrentPosition();
    if (_position != null) {
      var failureOrSuccess = await getPrayerTimesUsecase(
        longitude: _position!.longitude,
        latitude: _position!.latitude,
        dateTime: dateTime,
      );
      failureOrSuccess.fold(
        (failure) {
          emit(state.copyWith(
            status: PrayerTimesRequestStatus.failure,
            errorMessage: failure.message,
          ));
        },
        (prayerTimes) {
          emit(state.copyWith(
            status: PrayerTimesRequestStatus.success,
            prayerTimes: prayerTimes,
          ));
        },
      );
    }
  }

  Future<bool> _handleLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception(AppStrings.locationDenied);
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception(AppStrings.locationPermanentlyDenied);
    }

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await Geolocator.openLocationSettings();
      if (!serviceEnabled) {
        throw Exception(AppStrings.locationDisabled);
      }
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    try {
      final hasPermission = await _handleLocationPermission();
      if (hasPermission) {
        _position = await Geolocator.getCurrentPosition();
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: PrayerTimesRequestStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
