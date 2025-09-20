import 'package:get/get.dart';
import 'package:money_expense_dot/features/expense/controller/expense_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put(ExpenseController());
  }
}
