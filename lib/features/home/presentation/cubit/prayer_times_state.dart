
import '../../domain/entities/prayer_times.dart';

abstract class PrayerTimesState {}

class PrayerTimesInitialState extends PrayerTimesState {

}


class PrayerTimesLoadingState extends PrayerTimesState {}

class PrayerTimesSuccessState extends PrayerTimesState {
  final DateTime currentDate;
  final List<PrayerTimes> prayerTimes;

  PrayerTimesSuccessState({required this.currentDate, required this.prayerTimes});

}

class PrayerTimesFailureState extends PrayerTimesState {
  final String message;

  PrayerTimesFailureState({required this.message});
}
