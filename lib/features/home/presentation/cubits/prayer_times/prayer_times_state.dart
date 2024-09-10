// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../domain/entities/prayer_times.dart';

enum PrayerTimesRequestStatus { loading, success, failure }

class PrayerTimesState extends Equatable {
  final PrayerTimesRequestStatus status;
  final List<PrayerTimes> prayerTimes;
  final String errorMessage;
  final DateTime currentDate;

  const PrayerTimesState._({
    required this.status,
    required this.prayerTimes,
    required this.errorMessage,
    required this.currentDate,
  });

  factory PrayerTimesState({
    PrayerTimesRequestStatus? status,
    List<PrayerTimes>? prayerTimes,
    String? errorMessage,
    DateTime? currentDate,
  }) {
    return PrayerTimesState._(
      status: status ?? PrayerTimesRequestStatus.loading,
      prayerTimes: prayerTimes ?? const [],
      errorMessage: errorMessage ?? '',
      currentDate: currentDate ?? DateTime.now(),
    );
  }

  PrayerTimesState copyWith({
    PrayerTimesRequestStatus? status,
    List<PrayerTimes>? prayerTimes,
    String? errorMessage,
    DateTime? currentDate,
  }) {
    return PrayerTimesState(
      status: status ?? this.status,
      prayerTimes: prayerTimes ?? this.prayerTimes,
      errorMessage: errorMessage ?? this.errorMessage,
      currentDate: currentDate ?? this.currentDate,
    );
  }

  @override
  List<Object?> get props => [
        status,
        prayerTimes,
        errorMessage,
        currentDate,
      ];
}
