// ignore_for_file: unnecessary_this

import 'package:get/get.dart';
import 'package:intl/intl.dart';

/// DateTime helpers for formatting and time adjustment.
extension DateTimeExtension on DateTime {
  /// Formats to a localized string (e.g. "Friday, 19 September 2025").
  String get toDate => DateFormat('EEEE, dd MMMM yyyy', Get.locale?.toString())
      .format(this.toLocal());

  /// Returns this date with the current system time.
  DateTime withTimeOfNow() {
    final now = DateTime.now();
    return DateTime(year, month, day, now.hour, now.minute, now.second);
  }
}
