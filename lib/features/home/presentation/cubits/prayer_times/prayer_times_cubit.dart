import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_location_usecase.dart';
import '../../../domain/usecases/get_prayer_times_usecase.dart';

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

    final locationResult = await getLocationUsecase();

    locationResult.fold(
      (failure) {
        emit(state.copyWith(
          status: PrayerTimesRequestStatus.failure,
          errorMessage: failure.message,
        ));
      },
      (position) async {
        // Ensure we have a valid position before proceeding
        var failureOrSuccess = await getPrayerTimesUsecase(
          longitude: position.longitude,
          latitude: position.latitude,
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
      },
    );
  }
}
