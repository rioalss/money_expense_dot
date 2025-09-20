import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:money_expense_dot/shared/data/model/expense_group_model.dart';
import 'package:money_expense_dot/shared/utils/extension/double_extension.dart';
import 'package:money_expense_dot/shared/utils/extension/int_extension.dart';
import 'package:money_expense_dot/shared/utils/extension/string_extension.dart';
import 'package:money_expense_dot/shared/widgets/empty.dart';
import 'package:money_expense_dot/shared/widgets/loading_card.dart';
import 'package:money_expense_dot/themes/typography.dart';

class ExpenseByCategoryWidget extends StatelessWidget {
  const ExpenseByCategoryWidget({
    super.key,
    required this.expenses,
    this.isLoading = false,
  });
  final List<ExpenseGroup> expenses;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'Pengeluaran berdasarkan kategori',
            style: Font.bold.fs14.gray1(),
          ),
        ),
        if (isLoading) ...[
          loading(),
        ] else if (expenses.isEmpty) ...[
          const EmptyText( message:"Kamu belum menambahkan pengeluaran untuk kategori apapun." ),
        ] else
          hasData(),
      ],
    );
  }

  SizedBox hasData() {
    return SizedBox(
      height: 160.h,
      child: ListView.separated(
          itemCount: expenses.length,
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          separatorBuilder: (context, index) => 20.w.kW,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return cardExpense(
              expenses[index],
            );
          }),
    );
  }

  SizedBox loading() {
    return SizedBox(
      height: 160.h,
      child: ListView.separated(
          itemCount: 3,
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          separatorBuilder: (context, index) => 20.w.kW,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return LoadingCard(
              height: 120.h,
              width: 120.w,
            );
          }),
    );
  }

  Container cardExpense(ExpenseGroup data) {
    return Container(
      width: 120.w,
      padding: EdgeInsets.only(
        top: 16.h,
        bottom: 18.h,
        left: 16.w,
        right: 16.w,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36.w,
            height: 36.h,
            padding: const EdgeInsets.all(6).r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: data.category.toCategoryExpense.color,
            ),
            child: SvgPicture.asset(
              data.category.toCategoryExpense.icon,
              fit: BoxFit.scaleDown,
            ),
          ),
          12.h.kH,
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              data.category,
              style: Font.regular.fs12.gray3(),
            ),
          ),
          8.h.kH,
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              data.total.toInt().toRupiah,
              style: Font.bold.fs12.gray1(),
            ),
          )
        ],
      ),
    );
  }
}
