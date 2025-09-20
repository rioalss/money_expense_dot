// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension IntExtension on int {
  Widget get kW => SizedBox(width: this.toDouble());
  Widget get kH => SizedBox(height: this.toDouble());

  /// Returns String formated rupiah
  String get toRupiah =>
      NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0)
          .format(this);
  String get toPrettyNumber =>
      NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0)
          .format(this);
}

extension NullableIntExtension on int? {
  bool get isNull => this == null;
  bool get isNullOrZero => this == null || this == 0;

}