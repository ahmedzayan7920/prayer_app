
abstract class PrayerTimesState {}

class PrayerTimesInitialState extends PrayerTimesState {}

class PrayerTimesChangeDateState extends PrayerTimesState {}

class PrayerTimesLoadingState extends PrayerTimesState {}

class PrayerTimesSuccessState extends PrayerTimesState {}

class PrayerTimesFailureState extends PrayerTimesState {
  final String message;

  PrayerTimesFailureState({required this.message});
}
