import 'package:flutter/material.dart';

extension DoubleSizeExt on double {
  Widget get kW => SizedBox(width: this);
  Widget get kH => SizedBox(height: this);
}