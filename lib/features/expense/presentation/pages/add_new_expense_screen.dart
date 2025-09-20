// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:money_expense_dot/features/expense/controller/expense_controller.dart';
import 'package:money_expense_dot/features/expense/presentation/widget/appbar_widget.dart';
import 'package:money_expense_dot/features/expense/presentation/widget/bottom_sheet_category_widget.dart';
import 'package:money_expense_dot/shared/data/model/expense_model.dart';
import 'package:money_expense_dot/shared/gen/assets.gen.dart';
import 'package:money_expense_dot/shared/utils/constant/app_constant.dart';
import 'package:money_expense_dot/shared/utils/enum/category.dart';
import 'package:money_expense_dot/shared/utils/enum/status.dart';
import 'package:money_expense_dot/shared/utils/extension/date_time_extension.dart';
import 'package:money_expense_dot/shared/utils/extension/double_extension.dart';
import 'package:money_expense_dot/shared/utils/extension/int_extension.dart';
import 'package:money_expense_dot/shared/utils/extension/string_extension.dart';
import 'package:money_expense_dot/shared/utils/helpers/input_formatter.dart';
import 'package:money_expense_dot/shared/utils/helpers/date_time_helper.dart';
import 'package:money_expense_dot/shared/widgets/button.dart';
import 'package:money_expense_dot/shared/widgets/input.dart';

class AddNewExpenseScreen extends StatefulWidget {
  const AddNewExpenseScreen({super.key});

  @override
  State<AddNewExpenseScreen> createState() => _AddNewExpenseScreenState();
}

class _AddNewExpenseScreenState extends State<AddNewExpenseScreen> {
  late Category category;
  DateTime? dateExpense;
  final categoryController = TextEditingController();
  final dateController = TextEditingController();
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  final ValueNotifier<bool> _isDisable = ValueNotifier(true);

  @override
  void initState() {
    category = AppConstant.categoryList.first;
    categoryController.text = category.name;

    super.initState();
  }

  checkDisable() {
    final nameText = nameController.text.trim();

    _isDisable.value = dateExpense == null ||
        nameText.isEmpty ||
        amountController.text.takeNumber.isNullOrZero;
  }

  @override
  void dispose() {
    categoryController.dispose();
    dateController.dispose();
    nameController.dispose();
    amountController.dispose();
    _isDisable.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Tambah Pengeluaran Baru'),
      body: GetBuilder<ExpenseController>(builder: (expenseController) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                38.h.kH,
                Input(
                  controller: nameController,
                  hint: 'Nama Pengeluaran',
                  onChanged: (value) {
                    checkDisable();
                  },
                ),
                20.h.kH,
                Input(
                  controller: categoryController,
                  readOnly: true,
                  prefixWidget: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: SvgPicture.asset(category.icon,
                        colorFilter:
                            ColorFilter.mode(category.color, BlendMode.srcIn)),
                  ),
                  suffixWidget: Assets.icons.arrowRightIcon.svg(),
                  onChanged: (value) {
                    checkDisable();
                  },
                  onTap: () async {
                    Category? data = await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return const BottomSheetCategoryWidget();
                      },
                    );
                    if (data != null) {
                      setState(() {
                        category = data;
                        categoryController.text = data.name;
                      });
                    }
                  },
                ),
                20.h.kH,
                Input(
                  controller: dateController,
                  hint: 'Tanggal Pengeluaran',
                  readOnly: true,
                  suffixWidget: Assets.icons.uilCalendarAlt.svg(),
                  onChanged: (value) {
                    checkDisable();
                  },
                  onTap: () async {
                    DateTime? date = await DateTimeHelper().pickDate(
                      context,
                      dateCurrent: dateExpense,
                    );
                    if (date != null) {
                      setState(() {
                        dateExpense = date.withTimeOfNow();
                        dateController.text = date.toDate;
                      });
                    }
                  },
                ),
                20.h.kH,
                Input(
                  controller: amountController,
                  hint: 'Nominal',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    NumericInputFormatter(),
                    CurrencyInputFormatter(),
                  ],
                  onChanged: (value) {
                    checkDisable();
                  },
                ),
                32.h.kH,
                ValueListenableBuilder(
                  valueListenable: _isDisable,
                  builder: (context, _, __) {
                    return Obx(
                      () {
                        if (expenseController.statusCreateExpense.value ==
                            StatusState.loading) {
                          return const ButtonLoading();
                        }
                        return ButtonCustom(
                          onPressed: () async {
                            Expense expense = Expense(
                              name: nameController.text,
                              date: dateExpense!,
                              category: category.name,
                              amount: amountController.text.takeNumber ?? 0,
                            );

                            await expenseController.addExpense(expense);
                          },
                          text: 'Simpan',
                          disable: _isDisable.value,
                        );
                      },
                    );
                  },
                ),
                32.h.kH,
              ],
            ),
          ),
        );
      }),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
