import 'dart:ui';

import 'package:money_expense_dot/themes/app_color.dart';

enum ExpenseType {
  perDay(
    name: "Pengeluaranmu\nhari ini",
    color: AppColor.blue,
  ),
  perMonth(
    name: "Pengeluaranmu\nbulan ini",
    color: AppColor.teal,
  );

  final String name;
  final Color color;

  const ExpenseType({
    required this.name,
    required this.color,
  });
}
