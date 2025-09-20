import 'package:money_expense_dot/shared/utils/enum/category.dart';

class AppConstant {
  static List<Category> categoryList = [
    Category.food,
    Category.internet,
    Category.education,
    Category.gift,
    Category.transport,
    Category.shop,
    Category.homeAppliance,
    Category.sport,
    Category.entertainment,
  ];

  static const String food = 'Makanan';
  static const String internet = 'Internet';
  static const String education = 'Edukasi';
  static const String gift = 'Hadiah';
  static const String transport = 'Transport';
  static const String shop = 'Belanja';
  static const String homeAppliance = 'Alat Rumah';
  static const String sport = 'Olahraga';
  static const String entertainment = 'Hiburan';
}
