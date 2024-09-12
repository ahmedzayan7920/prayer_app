// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "app_name": MessageLookupByLibrary.simpleMessage("مواقيت الصلاة"),
        "arabic": MessageLookupByLibrary.simpleMessage("العربية"),
        "asr": MessageLookupByLibrary.simpleMessage("العصر"),
        "badCertificate":
            MessageLookupByLibrary.simpleMessage("الشهادة غير صالحة"),
        "cancelError": MessageLookupByLibrary.simpleMessage("تم إلغاء الطلب"),
        "connectionTimeout":
            MessageLookupByLibrary.simpleMessage("اتصال بالخادم فشل"),
        "duhr": MessageLookupByLibrary.simpleMessage("الظهر"),
        "english": MessageLookupByLibrary.simpleMessage("الانجليزية"),
        "esha": MessageLookupByLibrary.simpleMessage("العشاء"),
        "fajr": MessageLookupByLibrary.simpleMessage("الفجر"),
        "internalServerError":
            MessageLookupByLibrary.simpleMessage("خطأ في الخادم"),
        "locationDenied": MessageLookupByLibrary.simpleMessage(
            "تم رفض أذن الموقع. يرجى تمكين أذن الموقع في أعدادات الجهاز."),
        "locationInProgress": MessageLookupByLibrary.simpleMessage(
            "طلب الإذن قيد التقدم بالفعل. يرجى الانتظار حتى يكتمل الطلب الحالي."),
        "locationNotFound": MessageLookupByLibrary.simpleMessage(
            "الإعدادات الخاصة بالنظام الأساسي مفقودة. يرجى التأكد من أن الأذونات الصحيحة محددة في ملف AndroidManifest.xml أو Info.plist."),
        "locationPermanentlyDenied": MessageLookupByLibrary.simpleMessage(
            "إذن الموقع مرفوض بشكل دائم. يرجى تمكين أذن الموقع في أعدادات الجهاز."),
        "locationServiceDisabled": MessageLookupByLibrary.simpleMessage(
            "خدمات الموقع معطلة. يرجى تمكين خدمات الموقع في إعدادات الجهاز."),
        "locationTimeout": MessageLookupByLibrary.simpleMessage(
            "انتهت مهلة طلب الموقع. يرجى المحاولة مرة أخرى أو التحقق من إعدادات الموقع."),
        "maghreeb": MessageLookupByLibrary.simpleMessage("المغرب"),
        "noInternet":
            MessageLookupByLibrary.simpleMessage("لا يوجد اتصال بالانترنت"),
        "notFound":
            MessageLookupByLibrary.simpleMessage("لم يتم العثور على الطلب"),
        "receiveTimeout":
            MessageLookupByLibrary.simpleMessage("تم استلام الرسالة فشل"),
        "retry": MessageLookupByLibrary.simpleMessage("أعد المحاولة"),
        "sendTimeout": MessageLookupByLibrary.simpleMessage("إرسال فشل"),
        "unableToDetermineLocationPermission":
            MessageLookupByLibrary.simpleMessage(
                "غير قادر على تحديد أذن الموقع."),
        "unexpectedError":
            MessageLookupByLibrary.simpleMessage("خطأ غير متوقع")
      };
}
