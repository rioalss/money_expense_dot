import 'package:money_expense_dot/shared/data/model/expense_model.dart';

class ExpenseGroup {
  final String category;
  final List<Expense> expenses;
  final double total;

  ExpenseGroup({
    required this.category,
    required this.expenses,
    required this.total,
  });
}
