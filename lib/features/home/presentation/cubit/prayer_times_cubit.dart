import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:prayer_app/core/utils/app_strings.dart';
import 'package:prayer_app/features/home/domain/entities/prayer_times.dart';
import 'package:prayer_app/features/home/domain/usecases/get_prayer_times_usecase.dart';

import 'prayer_times_state.dart';

class PrayerTimesCubit extends Cubit<PrayerTimesState> {
  PrayerTimesCubit({required this.getPrayerTimesUsecase}) : super(PrayerTimesInitialState());
  final GetPrayerTimesUsecase getPrayerTimesUsecase;

  DateTime currentDate = DateTime.now();

  changeCurrentDate(DateTime selectedDate) {
    currentDate = selectedDate;
    if (state is! PrayerTimesFailureState) {
      emit(PrayerTimesChangeDateState());
    }
  }

  Position? position;

  List<PrayerTimes> prayerTimes = [];

  getPrayerTimes() async {
    emit(PrayerTimesLoadingState());
    await _getCurrentPosition();
    if (position != null) {
      var failureOrSuccess = await getPrayerTimesUsecase(
        longitude: position!.longitude,
        latitude: position!.latitude,
      );
      failureOrSuccess.fold(
        (failure) {
          emit(PrayerTimesFailureState(message: failure.errMessage));
        },
        (prayerTimes) {
          this.prayerTimes = prayerTimes;
          emit(PrayerTimesSuccessState());
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
        position = await Geolocator.getCurrentPosition();
      }
    } catch (e) {
      emit(PrayerTimesFailureState(message: e.toString()));
    }
  }
}
