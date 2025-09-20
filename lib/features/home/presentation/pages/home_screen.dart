// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:money_expense_dot/features/expense/controller/expense_controller.dart';
import 'package:money_expense_dot/features/expense/presentation/pages/add_new_expense_screen.dart';
import 'package:money_expense_dot/features/home/presentation/widget/expense_by_category_widget.dart';
import 'package:money_expense_dot/features/home/presentation/widget/header_expense_widget.dart';
import 'package:money_expense_dot/features/home/presentation/widget/header_name_widget.dart';
import 'package:money_expense_dot/features/home/presentation/widget/list_expense_widget.dart';
import 'package:money_expense_dot/shared/gen/assets.gen.dart';
import 'package:money_expense_dot/shared/utils/enum/expense_day.dart';
import 'package:money_expense_dot/shared/utils/extension/double_extension.dart';
import 'package:money_expense_dot/themes/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0.0, 0.1), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _animationController, curve: Curves.easeInOut));

    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ExpenseController>(builder: (expenseController) {
          return Obx(() {
            return RefreshIndicator(
              onRefresh: () async {
                await expenseController.loadExpenses();
              },
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 100.h),
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderNameWidget(
                          padding: const EdgeInsets.all(20).r,
                        ),
                        HeaderExpenseWidget(
                          padding: const EdgeInsets.symmetric(horizontal: 20).w,
                          isLoading: expenseController.isLoading.value,
                          expenseDayAmount:
                              expenseController.todayTotal.toInt(),
                          expenseMonthAmount:
                              expenseController.monthTotal.toInt(),
                        ),
                        20.h.kH,
                        ExpenseByCategoryWidget(
                          isLoading: expenseController.isLoading.value,
                          expenses: expenseController.expensesByCategory,
                        ),
                        8.h.kH,
                        ListExpenseWidget(
                          isLoading: expenseController.isLoading.value,
                          expenseDay: ExpenseDay.today,
                          expensesData: expenseController.todayExpenses.value,
                        ),
                        8.h.kH,
                        ListExpenseWidget(
                          isLoading: expenseController.isLoading.value,
                          expenseDay: ExpenseDay.yesterday,
                          expensesData:
                              expenseController.yesterdayExpenses.value,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        }),
      ),
      floatingActionButton: floatingActionButton(),
    );
  }

  Padding floatingActionButton() {
    return Padding(
      padding: EdgeInsets.only(right: 10.w, bottom: 10.h),
      child: SizedBox(
        height: 44.h,
        width: 44.w,
        child: FloatingActionButton(
          backgroundColor: AppColor.blue,
          isExtended: true,
          shape: const CircleBorder(),
          onPressed: () {
            Get.to(
              () => const AddNewExpenseScreen(),
              transition: Transition.downToUp,
              duration: .4.seconds,
            );
          },
          child: Assets.icons.plusIcon.svg(height: 15.h, fit: BoxFit.fitHeight),
        ),
      ),
    );
  }
}
