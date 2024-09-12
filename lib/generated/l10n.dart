// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Prayer Times`
  String get app_name {
    return Intl.message(
      'Prayer Times',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Fajr`
  String get fajr {
    return Intl.message(
      'Fajr',
      name: 'fajr',
      desc: '',
      args: [],
    );
  }

  /// `Duhr`
  String get duhr {
    return Intl.message(
      'Duhr',
      name: 'duhr',
      desc: '',
      args: [],
    );
  }

  /// `Asr`
  String get asr {
    return Intl.message(
      'Asr',
      name: 'asr',
      desc: '',
      args: [],
    );
  }

  /// `Maghreeb`
  String get maghreeb {
    return Intl.message(
      'Maghreeb',
      name: 'maghreeb',
      desc: '',
      args: [],
    );
  }

  /// `Esha`
  String get esha {
    return Intl.message(
      'Esha',
      name: 'esha',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Connection timeout with ApiServer`
  String get connectionTimeout {
    return Intl.message(
      'Connection timeout with ApiServer',
      name: 'connectionTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Send timeout with ApiServer`
  String get sendTimeout {
    return Intl.message(
      'Send timeout with ApiServer',
      name: 'sendTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Receive timeout with ApiServer`
  String get receiveTimeout {
    return Intl.message(
      'Receive timeout with ApiServer',
      name: 'receiveTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Request to ApiServer was canceled`
  String get cancelError {
    return Intl.message(
      'Request to ApiServer was canceled',
      name: 'cancelError',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get noInternet {
    return Intl.message(
      'No Internet Connection',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected Error, Please try again`
  String get unexpectedError {
    return Intl.message(
      'Unexpected Error, Please try again',
      name: 'unexpectedError',
      desc: '',
      args: [],
    );
  }

  /// `Your request not found, Please try later`
  String get notFound {
    return Intl.message(
      'Your request not found, Please try later',
      name: 'notFound',
      desc: '',
      args: [],
    );
  }

  /// `Internal Server error, Please try later`
  String get internalServerError {
    return Intl.message(
      'Internal Server error, Please try later',
      name: 'internalServerError',
      desc: '',
      args: [],
    );
  }

  /// `Bad certificate`
  String get badCertificate {
    return Intl.message(
      'Bad certificate',
      name: 'badCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Required platform-specific configuration is missing. Please ensure the proper permissions are defined in the AndroidManifest.xml or Info.plist.`
  String get locationNotFound {
    return Intl.message(
      'Required platform-specific configuration is missing. Please ensure the proper permissions are defined in the AndroidManifest.xml or Info.plist.',
      name: 'locationNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Permission request is already in progress. Please wait for the current request to complete.`
  String get locationInProgress {
    return Intl.message(
      'Permission request is already in progress. Please wait for the current request to complete.',
      name: 'locationInProgress',
      desc: '',
      args: [],
    );
  }

  /// `Location request timed out. Please try again or check your location settings.`
  String get locationTimeout {
    return Intl.message(
      'Location request timed out. Please try again or check your location settings.',
      name: 'locationTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Location services are disabled. Please enable location services in your device settings.`
  String get locationServiceDisabled {
    return Intl.message(
      'Location services are disabled. Please enable location services in your device settings.',
      name: 'locationServiceDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Location permission was denied. Please enable location permission in your device settings.`
  String get locationDenied {
    return Intl.message(
      'Location permission was denied. Please enable location permission in your device settings.',
      name: 'locationDenied',
      desc: '',
      args: [],
    );
  }

  /// `Location permission was permanently denied. Please enable location permission in your device settings.`
  String get locationPermanentlyDenied {
    return Intl.message(
      'Location permission was permanently denied. Please enable location permission in your device settings.',
      name: 'locationPermanentlyDenied',
      desc: '',
      args: [],
    );
  }

  /// `Unable to determine location permission.`
  String get unableToDetermineLocationPermission {
    return Intl.message(
      'Unable to determine location permission.',
      name: 'unableToDetermineLocationPermission',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
