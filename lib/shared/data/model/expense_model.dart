import 'package:hive/hive.dart';

part 'expense_model.g.dart';

@HiveType(typeId: 0)
class Expense extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  DateTime date;

  @HiveField(2)
  String category;

  @HiveField(3)
  int amount;

  Expense({
    required this.name,
    required this.date,
    required this.category,
    required this.amount,
  });
}
