enum ExpenseDay {
  today(
    name: "Hari ini",
  ),
  yesterday(
    name: "Kemarin",
  );

  final String name;

  const ExpenseDay({
    required this.name,
  });
}
