import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_expense_dot/shared/utils/extension/double_extension.dart';
import 'package:money_expense_dot/themes/typography.dart';

class HeaderNameWidget extends StatelessWidget {
  const HeaderNameWidget({
    super.key,
    this.name,
    this.message,
    this.padding,
  });
  final String? name;
  final String? message;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Halo, ${name ?? 'User!'}',
            style: Font.bold.fs18.gray1(),
          ),
          4.h.kH,
          Text(
            message ?? 'Jangan lupa catat keuanganmu setiap hari!',
            style: Font.regular.fs14.gray3(),
          ),
        ],
      ),
    );
  }
}
