import 'package:get/get.dart';
import 'package:money_expense_dot/features/home/presentation/pages/home_screen.dart';
import 'package:money_expense_dot/shared/data/model/expense_group_model.dart';
import 'package:money_expense_dot/shared/data/model/expense_model.dart';
import 'package:money_expense_dot/shared/data/model/result.dart';
import 'package:money_expense_dot/shared/data/repositories/expense_repositories.dart';
import 'package:money_expense_dot/shared/utils/enum/status.dart';
import 'package:money_expense_dot/shared/utils/extension/expense_extension.dart';
import 'package:money_expense_dot/shared/widgets/toast_custom.dart';

class ExpenseController extends GetxController {
  static ExpenseController get to => Get.isRegistered<ExpenseController>()
      ? Get.find()
      : Get.put(ExpenseController());

  final ExpenseRepository _repository = ExpenseRepository();

  /// All expenses stored locally.
  final RxList<Expense> expenses = <Expense>[].obs;

  /// Expenses recorded today.
  final RxList<Expense> todayExpenses = <Expense>[].obs;

  /// Expenses recorded yesterday.
  final RxList<Expense> yesterdayExpenses = <Expense>[].obs;

  /// State of expense creation (loading/success/error).
  var statusCreateExpense = StatusState.initial.obs;

  /// Total expenses for today.
  final RxDouble todayTotal = 0.0.obs;

  /// Total expenses for the current month.
  final RxDouble monthTotal = 0.0.obs;

  /// Loading indicator state for fetching data.
  final RxBool isLoading = false.obs;

  /// Get grouped expenses by category.
  List<ExpenseGroup> get expensesByCategory =>
      expenses.groupAndTotalByCategory();

  /// Load all expenses, update totals and daily breakdowns.
  Future<void> loadExpenses() async {
    isLoading.value = true;
    await 3.delay();
    Result<List<Expense>> result = _repository.getAllExpenses();
    if (result.isSuccess) {
      expenses.assignAll(result.data!);
      expenses.sort((a, b) => b.date.compareTo(a.date));

      _updateTotals();
      _updateDailyExpenses();
    }
    isLoading.value = false;
  }

  /// Add a new expense entry.
  /// Shows toast on success/failure and reloads expenses.
  Future<void> addExpense(Expense expense) async {
    statusCreateExpense.value = StatusState.loading;
    final result = await _repository.addExpense(expense);
    await 2.delay();
    if (result.isSuccess) {
      statusCreateExpense.value = StatusState.success;
      Get.offAll(
        () => const HomeScreen(),
        transition: Transition.fade,
        duration: 1.seconds,
      );
      CustomToast.showToast(message: "Pengeluaran berhasil ditambahkan ✅");
      await loadExpenses();
    } else {
      CustomToast.showToast(
        message: result.error ?? 'Ada kesalahan.',
        type: TypeToast.error,
      );
      statusCreateExpense.value = StatusState.error;
    }
    update();
  }

  Future<Result<void>> deleteExpense(int key) async {
    final result = await _repository.deleteExpense(key);
    if (result.isSuccess) {
      await loadExpenses();
    }
    return result;
  }

  void _updateTotals() {
    final todayResult = _repository.getTodayTotal();
    final monthResult = _repository.getMonthTotal();

    if (todayResult.isSuccess) {
      todayTotal.value = todayResult.data!;
    }
    if (monthResult.isSuccess) {
      monthTotal.value = monthResult.data!;
    }
  }

  void _updateDailyExpenses() {
    final today = DateTime.now();
    final yesterday = today.subtract(const Duration(days: 1));

    final todayResult = _repository.getExpensesByDate(today);
    final yesterdayResult = _repository.getExpensesByDate(yesterday);

    if (todayResult.isSuccess) {
      todayExpenses.assignAll(todayResult.data!);
      todayExpenses.sort((a, b) => b.date.compareTo(a.date));
    }
    if (yesterdayResult.isSuccess) {
      yesterdayExpenses.assignAll(yesterdayResult.data!);
      yesterdayExpenses.sort((a, b) => b.date.compareTo(a.date));
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadExpenses();
  }
}
