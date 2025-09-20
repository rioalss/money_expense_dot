import 'package:money_expense_dot/shared/utils/constant/app_constant.dart';
import 'package:money_expense_dot/shared/utils/enum/category.dart';

extension StringExtension on String {
  // Return number only from String
  int? get takeNumber {
    return int.tryParse(replaceAll(RegExp('[^0-9]'), ''));
  }

  /// Converts string to enum Category.
  Category get toCategoryExpense {
    switch (this) {
      case AppConstant.food:
        return Category.food;
      case AppConstant.internet:
        return Category.internet;
      case AppConstant.education:
        return Category.education;
      case AppConstant.gift:
        return Category.gift;
      case AppConstant.transport:
        return Category.transport;
      case AppConstant.shop:
        return Category.shop;
      case AppConstant.homeAppliance:
        return Category.homeAppliance;
      case AppConstant.sport:
        return Category.sport;
      case AppConstant.entertainment:
        return Category.entertainment;
      default:
        throw ArgumentError("Kategori tidak dikenal: $this");
    }
  }
}
