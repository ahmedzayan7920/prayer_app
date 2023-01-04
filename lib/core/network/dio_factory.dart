import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../utils/app_constants.dart';

const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";

abstract class DioFactory {
  static Dio getDio() {
    Dio dio = Dio();

    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
    };

    dio.options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      headers: headers,
    );

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }

    return dio;
  }
}
