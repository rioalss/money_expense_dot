import 'package:money_expense_dot/shared/data/model/expense_group_model.dart';
import 'package:money_expense_dot/shared/data/model/expense_model.dart';

extension GroupingExtension on List<Expense> {
  /// Mengelompokkan expenses per kategori, menghitung total per kategori, dan sort by category.
  List<ExpenseGroup> groupAndTotalByCategory() {
    final Map<String, List<Expense>> grouped = {};

    // Grouping
    for (final expense in this) {
      grouped.putIfAbsent(expense.category, () => []);
      grouped[expense.category]!.add(expense);
    }

    // Membuat list ExpenseGroup
    final List<ExpenseGroup> result = [];
    grouped.forEach((category, expenses) {
      final total = expenses.fold<double>(
          0, (previousValue, element) => previousValue + element.amount);
      result.add(
          ExpenseGroup(category: category, expenses: expenses, total: total));
    });

    // Sort by category (ascending)
    result.sort((a, b) => a.category.compareTo(b.category));

    return result;
  }
}
