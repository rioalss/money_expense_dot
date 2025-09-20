import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_expense_dot/shared/utils/enum/expense_type.dart';
import 'package:money_expense_dot/shared/utils/extension/double_extension.dart';
import 'package:money_expense_dot/shared/utils/extension/int_extension.dart';
import 'package:money_expense_dot/shared/widgets/loading_card.dart';
import 'package:money_expense_dot/themes/typography.dart';

class HeaderExpenseWidget extends StatelessWidget {
  const HeaderExpenseWidget({
    super.key,
    required this.expenseDayAmount,
    required this.expenseMonthAmount,
    this.padding,
    this.isLoading = false,
  });
  final int expenseDayAmount;
  final int expenseMonthAmount;
  final EdgeInsetsGeometry? padding;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        children: [
          cardExpense(
            expenseType: ExpenseType.perDay,
            amount: expenseDayAmount,
            isLoading: isLoading,
          ),
          19.w.kW,
          cardExpense(
            expenseType: ExpenseType.perMonth,
            amount: expenseMonthAmount,
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }

  Expanded cardExpense({
    required ExpenseType expenseType,
    required int amount,
    bool isLoading = false,
  }) {
    if (isLoading) {
      return const Expanded(
        child: LoadingCard(),
      );
    }
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
          bottom: 10.h,
          top: 14.h,
          left: 14.w,
          right: 14.w,
        ),
        decoration: BoxDecoration(
          color: expenseType.color,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expenseType.name,
              style: Font.semiBold.fs14.white(),
            ),
            14.h.kH,
            Text(
              amount.toRupiah,
              style: Font.bold.fs18.white(),
            ),
          ],
        ),
      ),
    );
  }
}
