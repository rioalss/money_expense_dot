import 'package:hive/hive.dart';
import 'package:money_expense_dot/shared/data/model/expense_model.dart';
import 'package:money_expense_dot/shared/data/model/result.dart';
import 'package:money_expense_dot/shared/utils/logger/logger.dart';

class ExpenseRepository {
  final Box<Expense> _expenseBox = Hive.box<Expense>('expenses');

  Future<Result<String>> addExpense(Expense expense) async {
    try {
      await _expenseBox.add(expense);
      Log.i('Expense added: $expense', title: 'ExpenseRepository.addExpense');
      return Result.success('success');
    } catch (e, stack) {
      Log.e({'error': e.toString(), 'stack': stack.toString()},
          title: 'ExpenseRepository.addExpense');
      return Result.failure("Gagal menambahkan pengeluaran: $e");
    }
  }

  Result<List<Expense>> getAllExpenses() {
    try {
      final data = _expenseBox.values.toList();
      Log.d('Fetched ${data.length} expenses',
          title: 'ExpenseRepository.getAllExpenses');
      return Result.success(data);
    } catch (e, stack) {
      Log.e({'error': e.toString(), 'stack': stack.toString()},
          title: 'ExpenseRepository.getAllExpenses');
      return Result.failure("Gagal mengambil data: $e");
    }
  }

  Result<List<Expense>> getExpensesByDate(DateTime date) {
    try {
      final data = _expenseBox.values
          .where((e) =>
              e.date.year == date.year &&
              e.date.month == date.month &&
              e.date.day == date.day)
          .toList();
      Log.d('Fetched ${data.length} expenses on $date',
          title: 'ExpenseRepository.getExpensesByDate');
      return Result.success(data);
    } catch (e, stack) {
      Log.e({'error': e.toString(), 'stack': stack.toString()},
          title: 'ExpenseRepository.getExpensesByDate');
      return Result.failure("Gagal mengambil data berdasarkan tanggal: $e");
    }
  }

  Result<double> getTodayTotal() {
    try {
      final today = DateTime.now();
      final total = getExpensesByDate(today)
              .data
              ?.fold(0.0, (sum, e) => sum + e.amount) ??
          0.0;
      Log.i('Today total: $total', title: 'ExpenseRepository.getTodayTotal');
      return Result.success(total);
    } catch (e, stack) {
      Log.e({'error': e.toString(), 'stack': stack.toString()},
          title: 'ExpenseRepository.getTodayTotal');
      return Result.failure("Gagal menghitung total hari ini: $e");
    }
  }

  Result<double> getMonthTotal() {
    try {
      final now = DateTime.now();
      final total = _expenseBox.values
          .where((e) => e.date.year == now.year && e.date.month == now.month)
          .fold(0.0, (sum, e) => sum + e.amount);
      Log.i('Month total: $total', title: 'ExpenseRepository.getMonthTotal');
      return Result.success(total);
    } catch (e, stack) {
      Log.e({'error': e.toString(), 'stack': stack.toString()},
          title: 'ExpenseRepository.getMonthTotal');
      return Result.failure("Gagal menghitung total bulan ini: $e");
    }
  }

  Future<Result<String>> deleteExpense(int key) async {
    try {
      await _expenseBox.delete(key);
      Log.w('Expense deleted with key: $key',
          title: 'ExpenseRepository.deleteExpense');
      return Result.success('success');
    } catch (e, stack) {
      Log.e({'error': e.toString(), 'stack': stack.toString()},
          title: 'ExpenseRepository.deleteExpense');
      return Result.failure("Gagal menghapus pengeluaran: $e");
    }
  }
}
