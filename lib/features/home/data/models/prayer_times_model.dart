import '../../domain/entities/prayer_times.dart';

class PrayerTimesModel extends PrayerTimes {
  const PrayerTimesModel({
    required super.fajr,
    required super.duhr,
    required super.asr,
    required super.maghreeb,
    required super.esha,
  });

  factory PrayerTimesModel.fromJson(Map<String, dynamic> json) {
    return PrayerTimesModel(
      fajr: json["Fajr"],
      duhr: json["Dhuhr"],
      asr: json["Asr"],
      maghreeb: json["Maghrib"],
      esha: json["Isha"],
    );
  }

}
