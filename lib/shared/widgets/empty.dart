import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:money_expense_dot/shared/gen/assets.gen.dart';
import 'package:money_expense_dot/themes/typography.dart';

class EmptyText extends StatelessWidget {
  const EmptyText({
    super.key,
    this.message,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });
  final String? message;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            SvgPicture.asset(
              Assets.icons.emptyIcon.path,
              height: 200,
            ),
            Text(
              message ?? 'Oops! Belum ada data yang ditampilkan.',
              textAlign: TextAlign.center,
              style: Font.regular.fs15.black(),
            ),
          ],
        ),
      ),
    );
  }
}
