import 'package:dio/dio.dart';
import '../../../../core/utils/api_endpoints.dart';
import '../models/prayer_times_model.dart';

abstract class PrayerTimesRemoteDataSource {
  Future<List<PrayerTimesModel>> getPrayerTimes({
    required double longitude,
    required double latitude,
    required DateTime dateTime,
  });
}

class PrayerTimesRemoteDataSourceImplement
    implements PrayerTimesRemoteDataSource {
  final Dio dio;

  PrayerTimesRemoteDataSourceImplement({required this.dio});

  @override
  Future<List<PrayerTimesModel>> getPrayerTimes({
    required double longitude,
    required double latitude,
    required DateTime dateTime,
  }) async {
    try {
      final response = await dio.get(
        "${ApiEndPoints.calendar}/${dateTime.year}/${dateTime.month}",
        queryParameters: {
          "longitude": "$longitude",
          "latitude": "$latitude",
        },
      );
      return (response.data["data"] as List)
          .map((json) => PrayerTimesModel.fromJson(json["timings"]))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
