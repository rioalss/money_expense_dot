import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:money_expense_dot/shared/gen/assets.gen.dart';
import 'package:money_expense_dot/shared/utils/extension/double_extension.dart';
import 'package:money_expense_dot/themes/typography.dart';

class TopModalBottomSheet extends StatelessWidget {
  final String title;

  const TopModalBottomSheet({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Font.semiBold.fs14.gray2(),
          ),
        ),
        20.w.kW,
        GestureDetector(
          onTap: () => Get.back(),
          child: Assets.icons.uilMultiply.svg(),
        ),
      ],
    );
  }
}
