import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_expense_dot/themes/app_color.dart';
import 'package:money_expense_dot/themes/typography.dart';

class DateTimeHelper {
  Future<DateTime?> pickDate(
    context, {
    DateTime? dateCurrent,
    bool allowYesterday = true,
  }) =>
      showDatePicker(
        locale: Get.locale,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: AppColor.blue,
                ),
                splashFactory: NoSplash.splashFactory,
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    textStyle: Font.medium.fs14.white(),
                    padding: const EdgeInsets.only(bottom: 10),
                    foregroundColor: AppColor.blue,
                  ),
                ),
                textTheme: TextTheme(
                  bodyLarge: Font.medium.fs12.gray1(),
                ),
              ),
              child: child!,
            );
          },
          context: context,
          initialDate: (dateCurrent != null) ? (dateCurrent) : DateTime.now(),
          firstDate: allowYesterday
              ? DateTime.now().subtract(const Duration(days: 1)) 
              : DateTime.now(),
          lastDate: DateTime(9999));
}
