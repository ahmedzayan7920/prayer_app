// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "app_name": MessageLookupByLibrary.simpleMessage("Prayer Times"),
        "arabic": MessageLookupByLibrary.simpleMessage("Arabic"),
        "asr": MessageLookupByLibrary.simpleMessage("Asr"),
        "badCertificate":
            MessageLookupByLibrary.simpleMessage("Bad certificate"),
        "cancelError": MessageLookupByLibrary.simpleMessage(
            "Request to ApiServer was canceled"),
        "connectionTimeout": MessageLookupByLibrary.simpleMessage(
            "Connection timeout with ApiServer"),
        "duhr": MessageLookupByLibrary.simpleMessage("Duhr"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "esha": MessageLookupByLibrary.simpleMessage("Esha"),
        "fajr": MessageLookupByLibrary.simpleMessage("Fajr"),
        "internalServerError": MessageLookupByLibrary.simpleMessage(
            "Internal Server error, Please try later"),
        "locationDenied": MessageLookupByLibrary.simpleMessage(
            "Location permissions are denied."),
        "locationDisabled": MessageLookupByLibrary.simpleMessage(
            "Location services are disabled. Please enable the services."),
        "locationPermanentlyDenied": MessageLookupByLibrary.simpleMessage(
            "Location permissions are permanently denied, we cannot request permissions."),
        "maghreeb": MessageLookupByLibrary.simpleMessage("Maghreeb"),
        "noInternet":
            MessageLookupByLibrary.simpleMessage("No Internet Connection"),
        "notFound": MessageLookupByLibrary.simpleMessage(
            "Your request not found, Please try later"),
        "receiveTimeout": MessageLookupByLibrary.simpleMessage(
            "Receive timeout with ApiServer"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "sendTimeout":
            MessageLookupByLibrary.simpleMessage("Send timeout with ApiServer"),
        "unexpectedError": MessageLookupByLibrary.simpleMessage(
            "Unexpected Error, Please try again")
      };
}
