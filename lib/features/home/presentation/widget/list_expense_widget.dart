import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:money_expense_dot/shared/data/model/expense_model.dart';
import 'package:money_expense_dot/shared/utils/enum/expense_day.dart';
import 'package:money_expense_dot/shared/utils/extension/double_extension.dart';
import 'package:money_expense_dot/shared/utils/extension/int_extension.dart';
import 'package:money_expense_dot/shared/utils/extension/string_extension.dart';
import 'package:money_expense_dot/shared/widgets/empty.dart';
import 'package:money_expense_dot/shared/widgets/loading_card.dart';
import 'package:money_expense_dot/themes/typography.dart';

class ListExpenseWidget extends StatelessWidget {
  const ListExpenseWidget({
    super.key,
    required this.expenseDay,
    required this.expensesData,
    this.isLoading = false,
  });
  final ExpenseDay expenseDay;
  final List<Expense> expensesData;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            expenseDay.name,
            style: Font.bold.fs14.gray1(),
          ),
        ),
        if (isLoading) ...[
          loading(),
        ] else if (expensesData.isEmpty) ...[
          EmptyText(
            message: 'Belum ada pengeluaran untuk ${expenseDay.name.toLowerCase()}.',
          ),
        ] else
          hasData(),
      ],
    );
  }

  ListView hasData() {
    return ListView.separated(
        itemCount: expensesData.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20).r,
        separatorBuilder: (context, index) => 20.h.kH,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final data = expensesData[index];
          return cardExpense(data);
        });
  }

  ListView loading() {
    return ListView.separated(
        itemCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20).r,
        separatorBuilder: (context, index) => 20.h.kH,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const LoadingCard(
            height: 67,
          );
        });
  }

  Container cardExpense(Expense data) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.only(
        top: 22.h,
        bottom: 21.h,
        left: 14.w,
        right: 14.w,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12).r,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.08),
              blurRadius: 8,
              spreadRadius: 4,
              offset: const Offset(0, 4),
            )
          ]),
      child: Row(
        children: [
          SvgPicture.asset(
            data.category.toCategoryExpense.icon,
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
                data.category.toCategoryExpense.color, BlendMode.srcIn),
          ),
          14.w.kW,
          Expanded(
            child: Text(
              data.name,
              style: Font.regular.fs14.gray3(),
            ),
          ),
          14.w.kW,
          Text(
            data.amount.toRupiah,
            style: Font.semiBold.fs14.gray1(),
          ),
        ],
      ),
    );
  }
}
