import 'dart:ui';
import 'package:money_expense_dot/themes/app_color.dart';

enum Category {
  food(
    name: "Makanan",
    color: AppColor.yellow,
    icon: 'assets/icons/uil_pizza-slice.svg',
  ),
  internet(
    name: "Internet",
    color: AppColor.blue3,
    icon: 'assets/icons/uil_rss-alt.svg',
  ),
  education(
    name: "Edukasi",
    color: AppColor.orange,
    icon: 'assets/icons/uil_book-open.svg',
  ),
  gift(
    name: "Hadiah",
    color: AppColor.red,
    icon: 'assets/icons/uil_gift.svg',
  ),
  transport(
    name: "Transport",
    color: AppColor.purple1,
    icon: 'assets/icons/uil_car-sideview.svg',
  ),
  shop(
    name: "Belanja",
    color: AppColor.green2,
    icon: 'assets/icons/uil_shopping-cart.svg',
  ),
  homeAppliance(
    name: "Alat Rumah",
    color: AppColor.purple2,
    icon: 'assets/icons/uil_home.svg',
  ),
  sport(
    name: "Olahraga",
    color: AppColor.blue2,
    icon: 'assets/icons/uil_basketball.svg',
  ),
  entertainment(
    name: "Hiburan",
    color: AppColor.blue1,
    icon: 'assets/icons/uil_clapper-board.svg',
  ),
  ;

  final String name;
  final String icon;
  final Color color;

  const Category({
    required this.name,
    required this.icon,
    required this.color,
  });
}
