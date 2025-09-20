import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_expense_dot/shared/data/model/expense_model.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ExpenseAdapter());
    await Hive.openBox<Expense>('expenses');
  }
}
